module Pages.Login exposing (Model, Msg(..), page)

import Api.Data exposing (Data)
import Api.RandomOrg
import Api.User exposing (User)
import Bridge exposing (..)
import Browser.Navigation as Navigation
import Components.UserForm
import Effect exposing (Effect)
import Evergreen.V1.Pages.Register exposing (Msg(..))
import Gen.Route as Route
import Html exposing (button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Json exposing (string)
import OAuth
import OAuth.Implicit as OAuth
import Page
import Request exposing (Request)
import Shared
import Url exposing (Protocol(..), Url)
import Url.Parser.Query as Query
import Utils.Route
import View exposing (View)
import Json.Decode.Pipeline exposing (required)

page : Shared.Model -> Request -> Page.With Model Msg
page shared req =
    Page.advanced
        { init = init shared req
        , update = update req
        , subscriptions = subscriptions
        , view = view
        }


type alias UserInfo =
    { id : String
    , email : String
    , name : String
    , picture : String
    }


type alias Configuration =
    { authorizationEndpoint : Url
    , userInfoEndpoint : Url
    , userInfoDecoder : Json.Decoder UserInfo
    , clientId : String
    , scope : List String
    }


defaultHttpsUrl : Url
defaultHttpsUrl =
    { protocol = Https
    , host = ""
    , path = ""
    , port_ = Nothing
    , query = Nothing
    , fragment = Nothing
    }


loginUrl : Url
loginUrl =
    { protocol = Https
    , host = "lamdera-realworld.lamdera.app"
    , path = "/login"
    , port_ = Nothing
    , query = Nothing
    , fragment = Nothing
    }


{-| OAuth configuration.
Note that this demo also fetches basic user information with the obtained access token,
hence the user info endpoint and JSON decoder
-}
googleConfiguration : Configuration
googleConfiguration =
    { authorizationEndpoint =
        { defaultHttpsUrl | host = "accounts.google.com", path = "/o/oauth2/v2/auth" }
    , userInfoEndpoint =
        { defaultHttpsUrl | host = "www.googleapis.com", path = "/oauth2/v1/userinfo" }
    , userInfoDecoder =
        Json.map4 UserInfo
            (Json.field "id" Json.string)
            (Json.field "email" Json.string)
            (Json.field "name" Json.string)
            (Json.field "picture" Json.string)
    , clientId =
        "276782155307-dm34elu4su8tjk7pth81kp57vncill1s.apps.googleusercontent.com"
    , scope =
        [ "profile", "email" ]
    }


getGoolgeUserInfo : Configuration -> OAuth.Token -> Cmd Msg
getGoolgeUserInfo { userInfoDecoder, userInfoEndpoint } token =
    Http.request
        { method = "GET"
        , body = Http.emptyBody
        , headers = OAuth.useToken token []
        , url = Url.toString userInfoEndpoint
        , expect = Http.expectJson GotOauthUserInfo userInfoDecoder
        , timeout = Nothing
        , tracker = Nothing
        }


{-| OAuth configuration.
Note that this demo also fetches basic user information with the obtained access token,
hence the user info endpoint and JSON decoder
-}
facebookConfiguration : Configuration
facebookConfiguration =
    { authorizationEndpoint =
        { defaultHttpsUrl | host = "facebook.com", path = "/v6.0/dialog/oauth" }
    , userInfoEndpoint =
        { defaultHttpsUrl | host = "graph.facebook.com", path = "/v6.0/me", query = Just "fields=name,email,picture.type(large)" }
    , userInfoDecoder =
        Json.map4 UserInfo
            (Json.field "id" Json.string)
            (Json.field "email" Json.string)
            (Json.field "name" Json.string)
            (Json.field "picture" <| Json.field "data" <| Json.field "url" Json.string)
    , clientId =
        "533032778122323"
    , scope =
        [ "email", "public_profile" ]
    }


getFacebookUserInfo : Configuration -> OAuth.Token -> Cmd Msg
getFacebookUserInfo { userInfoDecoder, userInfoEndpoint } token =
    Http.request
        { method = "GET"
        , body = Http.emptyBody
        , headers = OAuth.useToken token []
        , url = Url.toString userInfoEndpoint
        , expect = Http.expectJson GotOauthUserInfo userInfoDecoder
        , timeout = Nothing
        , tracker = Nothing
        }


{-| In addition, Facebook returns parameters as query parameters instead of a fragments, and sometimes, a noise fragment is present in the response. So, as a work-around, one can patch the Url to make it compliant with the original RFC specification as follows:
-}
patchUrl : Url -> Url
patchUrl url =
    if url.fragment == Just "_=_" || url.fragment == Nothing then
        { url | fragment = url.query }

    else
        url



--
-- Facebook Wrong Implementation Work-Arounds
--


{-| No 'token\_type' is returned, so we have to provide a default one as Just "Bearer".
-}
tokenParser : Query.Parser (Maybe OAuth.Token)
tokenParser =
    Query.map (OAuth.makeToken (Just "Bearer"))
        (Query.string "access_token")


{-| In case of error, no 'error' field is returned, but instead we find a field named 'error\_code'
-}
errorParser : Query.Parser (Maybe OAuth.ErrorCode)
errorParser =
    Query.map (Maybe.map OAuth.errorCodeFromString)
        (Query.string "error_code")


{-| Put everything together and rely on `OAuth.parseTokenWith` instead of the default parser
-}
parsers : OAuth.Parsers OAuth.AuthorizationError OAuth.AuthorizationSuccess
parsers =
    { tokenParser = tokenParser
    , errorParser = errorParser
    , authorizationSuccessParser = OAuth.defaultAuthorizationSuccessParser
    , authorizationErrorParser = OAuth.defaultAuthorizationErrorParser
    }

type alias OAuthState =
    { random: String
    , authType : String
    }

oAuthStateDecoder : Json.Decoder OAuthState
oAuthStateDecoder =
    Json.succeed OAuthState
        |> required "random" string
        |> required "authType" string


-- INIT


type alias Model =
    { user : Data User
    , email : String
    , password : String
    , random : String
    , message : String
    }


init : Shared.Model -> Request -> ( Model, Effect Msg )
init shared req =
    let
        origin =
            req.url

        redirectUri =
            { origin | query = Nothing, fragment = Nothing }

        clearUrl =
            Navigation.replaceUrl req.key (Url.toString redirectUri)

        model =
            case shared.user of
                Just user ->
                    Model (Api.Data.Success user) "" "" "" ""

                Nothing ->
                    Model Api.Data.NotAsked "" "" "" ""
    in
    case OAuth.parseTokenWith parsers (patchUrl origin) of
        OAuth.Empty ->
            ( model
            , Effect.fromCmd (Api.RandomOrg.get5Random32Bit RandomSeedResult)
            )

        -- It is important to set a `state` when making the authorization request
        -- and to verify it after the redirection. The state can be anything but its primary
        -- usage is to prevent cross-site request forgery; at minima, it should be a short,
        -- non-guessable string, generated on the fly.
        --
        -- We request a random string from RandomOrg and store it in the model and then
        -- verify the request's random string to the model and also the authType to know
        -- what type of OAuth request to make (Google or Facebook)
        OAuth.Success { token, state } ->
            let
                state_ =
                    Maybe.withDefault "not received" state

                authType = Json.decodeString oAuthStateDecoder state_ 

                (msg, cmd) =
                    case authType of
                        Ok oauthState ->
                            -- if oauthState.random == model.random then
                                case oauthState.authType of
                                   "google" -> ("goog: " ++ oauthState.random ++ " " ++ model.random, (getGoolgeUserInfo googleConfiguration token))
                                   "facebook" -> ("fb: " ++ oauthState.random ++ " " ++ model.random, (getFacebookUserInfo facebookConfiguration token))
                                   _ -> ("unknown authType: " ++ oauthState.random, Cmd.none)
                            -- else
                            --     Cmd.none
                        Err _ -> ("Json Error: " ++ state_, Cmd.none)

            in
            ( { model | message = msg }
            , Effect.fromCmd
                (Cmd.batch
                    [ cmd
                    , clearUrl
                    ]
                )
            )

        OAuth.Error _ ->
            ( model
            , Effect.fromCmd clearUrl
            )


-- UPDATE


type Msg
    = AttemptedSignIn
    | FacebookSignIn
    | GoogleSignIn
    | GotOauthUserInfo (Result Http.Error UserInfo)
    | GotUser (Data User)
    | RandomSeedResult (Result Http.Error String)
    | Updated Field String


type Field
    = Email
    | Password


update : Request -> Msg -> Model -> ( Model, Effect Msg )
update req msg model =
    case msg of
        Updated Email email ->
            ( { model | email = email }
            , Effect.none
            )

        Updated Password password ->
            ( { model | password = password }
            , Effect.none
            )

        GoogleSignIn ->
            let
                state =
                    "{\"random\":\"" ++ model.random ++ "\",\"authType\":\"google\"}"

                redirectUri =
                    loginUrl

                authorization =
                    { clientId = googleConfiguration.clientId
                    , redirectUri = redirectUri
                    , scope = googleConfiguration.scope
                    , state = Just state
                    , url = googleConfiguration.authorizationEndpoint
                    }
            in
            ( model
            , Effect.fromCmd <|
                (authorization
                    |> OAuth.makeAuthorizationUrl
                    |> Url.toString
                    |> Navigation.load
                )
            )

        FacebookSignIn ->
            let
                state =
                    "{\"random\":\"" ++ model.random ++ "\",\"authType\":\"facebook\"}"

                redirectUri =
                    loginUrl

                authorization =
                    { clientId = facebookConfiguration.clientId
                    , redirectUri = redirectUri
                    , scope = facebookConfiguration.scope
                    , state = Just state
                    , url = facebookConfiguration.authorizationEndpoint
                    }
            in
            ( model
            , Effect.fromCmd <|
                (authorization
                    |> OAuth.makeAuthorizationUrl
                    |> Url.toString
                    |> Navigation.load
                )
            )

        AttemptedSignIn ->
            ( model
            , (Effect.fromCmd << sendToBackend) <|
                UserAuthentication_Login
                    { params =
                        { email = model.email
                        , password = model.password
                        }
                    }
            )

        GotUser user ->
            case Api.Data.toMaybe user of
                Just user_ ->
                    ( { model | user = user }
                    , Effect.batch
                        [ Effect.fromCmd (Utils.Route.navigate req.key Route.Home_)
                        , Effect.fromShared (Shared.SignedInUser user_)
                        ]
                    )

                Nothing ->
                    ( { model | user = user }
                    , Effect.none
                    )

        GotOauthUserInfo userinfo ->
            case userinfo of
                Err _ ->
                    ( model
                    , Effect.none
                    )

                Ok userInfo ->
                    let
                        userId =
                            String.toInt userInfo.id |> Maybe.withDefault 0

                        user =
                            User userId userInfo.email userInfo.email Nothing userInfo.picture

                        datauser =
                            Api.Data.Success user
                    in
                    ( { model | user = datauser }
                    , Effect.batch
                        [ Effect.fromCmd (Utils.Route.navigate req.key Route.Home_)
                        , Effect.fromShared (Shared.SignedInUser user)
                        , Effect.fromCmd << sendToBackend <| Oauth2_Login user
                        ]
                    )

        RandomSeedResult result ->
            ( { model | random = Maybe.withDefault "0" (Api.RandomOrg.toMaybeUuid result) }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Sign in"
    , body =
        [ div [ class "container page" ]
            [ div [ class "row" ] []
            , div [ class "text-center auth-btn" ]
                [ button
                    [ onClick GoogleSignIn, class "btn-google" ]
                    [ text "Sign in" ]
                ]
            ]
        , div [ class "container page" ]
            [ div [ class "row" ] []
            , div [ class "text-center auth-btn" ]
                [ button
                    [ onClick FacebookSignIn, class "btn-facebook" ]
                    [ text "Sign in" ]
                ]
            ]
        , Components.UserForm.view
            { user = model.user
            , label = "Sign in"
            , onFormSubmit = AttemptedSignIn
            , alternateLink = { label = "Need an account?", route = Route.Register }
            , fields =
                [ { label = "Email"
                  , type_ = "email"
                  , value = model.email
                  , onInput = Updated Email
                  }
                , { label = "Password"
                  , type_ = "password"
                  , value = model.password
                  , onInput = Updated Password
                  }
                ]
            }
        , div [] [ text model.random ]

        , div [] [ text model.message ]
        ]
    }
