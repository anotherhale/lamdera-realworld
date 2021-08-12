module Pages.Login exposing (Model, Msg(..), page)

import Api.Data exposing (Data)
import Api.User exposing (User)
import Bridge exposing (..)
import Browser.Navigation as Navigation exposing (Key)
import Components.UserForm
import Effect exposing (Effect)
import Gen.Route as Route
import Page
import Request exposing (Request)
import Shared
import Utils.Route
import View exposing (View)
import Html exposing (button)
import Html.Events exposing (onClick)
import Html exposing (text)
import Html.Attributes exposing (class)
import Html exposing (div)
import Http
import Json.Decode as Json exposing (string, field)
import OAuth
import OAuth.Implicit as OAuth
import Url exposing (Protocol(..), Url)
import Evergreen.V1.Pages.Register exposing (Msg(..))
import Html exposing (s)
import Api.RandomOrg

page : Shared.Model -> Request -> Page.With Model Msg
page shared req =
    Page.advanced
        { init = init shared req
        , update = update req
        , subscriptions = subscriptions
        , view = view
        }



type alias UserInfo =
    { id: String
    , email: String
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

type alias OAuthState =
    { random : String
    , authType: String
    }

authTypeDecoder =
        Json.map2 OAuthState
            (Json.field "random" Json.string)
            (Json.field "authType" Json.string)
-- INIT


type alias Model =
    { user : Data User
    , email : String
    , password : String
    , random: String
    }


init : Shared.Model -> Request -> ( Model, Effect Msg )
init shared req =
    let
        origin = req.url
        redirectUri =
            { origin | query = Nothing, fragment = Nothing }

        clearUrl =
            Navigation.replaceUrl req.key (Url.toString redirectUri)
        model = case shared.user of
            Just user ->
                Model (Api.Data.Success user) "" "" ""

            Nothing ->
                Model Api.Data.NotAsked "" "" ""
    in
        -- (model,Effect.none)
    case OAuth.parseToken origin of
        OAuth.Empty -> 
            ( model
            , Effect.fromCmd (Api.RandomOrg.get5Random32Bit RandomSeedResult)
            )

        -- It is important to set a `state` when making the authorization request
        -- and to verify it after the redirection. The state can be anything but its primary
        -- usage is to prevent cross-site request forgery; at minima, it should be a short,
        -- non-guessable string, generated on the fly.
        --
        -- We remember any previously generated state  state using the browser's local storage
        -- and give it back (if present) to the elm application upon start
        OAuth.Success { token, state } ->  
            let
                authType = case state of
                    Just s -> case (Json.decodeString (field "authType" string) s) of
                                Ok a -> a
                                Err _-> "google"
                    Nothing -> "google"
                cmd = if (String.toLower authType) == "google" then
                        (getGoolgeUserInfo googleConfiguration token)
                      else
                        (getGoolgeUserInfo googleConfiguration token)
            in
            
            ( model
            , Effect.fromCmd (Cmd.batch 
                [ cmd
                , clearUrl
                ]
            ))

        OAuth.Error _ ->
            ( model, Effect.fromCmd clearUrl )



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
                state = "{ 'random': '" ++ model.random ++ "', 'authType: google'}"
                redirectUri = loginUrl
                authorization =
                    { clientId = googleConfiguration.clientId
                    , redirectUri = redirectUri
                    , scope = googleConfiguration.scope
                    , state = Just state
                    , url = googleConfiguration.authorizationEndpoint
                    }
            in
            ( model
            , Effect.fromCmd <| (authorization
                |> OAuth.makeAuthorizationUrl
                |> Url.toString
                |> Navigation.load)
            )

        FacebookSignIn ->
            ( model
            , Effect.none
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
                        userId = String.toInt userInfo.id |> Maybe.withDefault 0
                        user = (User userId userInfo.email userInfo.email Nothing userInfo.picture)
                        datauser = Api.Data.Success user
                    in
                    ( { model | user = datauser }
                    , Effect.batch
                        [ Effect.fromCmd (Utils.Route.navigate req.key Route.Home_)
                        , Effect.fromShared (Shared.SignedInUser user)
                        , Effect.fromCmd << sendToBackend <| (Oauth2_Login user)
                        ]
                    )

        RandomSeedResult result ->
            ( { model | random =  Maybe.withDefault "0" (Api.RandomOrg.toMaybeUuid result)  }, Effect.none)

                  
                    


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
            , div [ class "text-center auth-btn"] [ button 
                [ onClick GoogleSignIn, class "btn-google" ] [ text "Sign in" ] ]
            ]
        , div [ class "container page" ]
            [ div [ class "row" ] []
            , div [ class "text-center auth-btn"] [ button 
                [ onClick FacebookSignIn, class "btn-facebook" ] [ text "Sign in" ] ]
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
        ]

    }
