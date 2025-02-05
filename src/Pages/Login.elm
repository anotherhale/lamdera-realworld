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
import Json.Decode as Json
import OAuth
import OAuth.Implicit as OAuth
import Url exposing (Protocol(..), Url)

page : Shared.Model -> Request -> Page.With Model Msg
page shared req =
    Page.advanced
        { init = init shared req
        , update = update req
        , subscriptions = subscriptions
        , view = view
        }



type alias UserInfo =
    { name : String
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
    { protocol = Http
    , host = "localhost"
    , path = "signin"
    , port_ = Just 9000
    , query = Nothing
    , fragment = Nothing
    }
{-| OAuth configuration.
Note that this demo also fetches basic user information with the obtained access token,
hence the user info endpoint and JSON decoder
-}
configuration : Configuration
configuration =
    { authorizationEndpoint =
        { defaultHttpsUrl | host = "accounts.google.com", path = "/o/oauth2/v2/auth" }
    , userInfoEndpoint =
        { defaultHttpsUrl | host = "www.googleapis.com", path = "/oauth2/v1/userinfo" }
    , userInfoDecoder =
        Json.map2 UserInfo
            (Json.field "name" Json.string)
            (Json.field "picture" Json.string)
    , clientId =
        "909608474358-fkok86ks7e83c47aq01aiit47vsoh4s0.apps.googleusercontent.com"
    , scope =
        [ "profile" ]
    }


getUserInfo : Configuration -> OAuth.Token -> Cmd Msg
getUserInfo { userInfoDecoder, userInfoEndpoint } token =
    Http.request
        { method = "GET"
        , body = Http.emptyBody
        , headers = OAuth.useToken token []
        , url = Url.toString userInfoEndpoint
        , expect = Http.expectJson GotUserInfo userInfoDecoder
        , timeout = Nothing
        , tracker = Nothing
        }

-- INIT


type alias Model =
    { user : Data User
    , email : String
    , password : String
    }


init : Shared.Model -> Request -> ( Model, Effect Msg )
init shared req =
    let
        state = "some_state"
        origin = req.url
        redirectUri =
            { origin | query = Nothing, fragment = Nothing }

        clearUrl =
            Navigation.replaceUrl req.key (Url.toString redirectUri)
        model = case shared.user of
            Just user ->
                Model (Api.Data.Success user) "" ""

            Nothing ->
                Model Api.Data.NotAsked "" ""
    in
        (model,Effect.none)
    -- case OAuth.parseToken origin of
    --     OAuth.Empty -> ( model, Effect.none)

    --     -- It is important to set a `state` when making the authorization request
    --     -- and to verify it after the redirection. The state can be anything but its primary
    --     -- usage is to prevent cross-site request forgery; at minima, it should be a short,
    --     -- non-guessable string, generated on the fly.
    --     --
    --     -- We remember any previously generated state  state using the browser's local storage
    --     -- and give it back (if present) to the elm application upon start
    --     OAuth.Success { token } ->
    --         ( model
    --         , Effect.fromCmd (Cmd.batch [  (getUserInfo configuration token)
    --                     , clearUrl
    --                     ]
    --         ))

    --     OAuth.Error error ->
    --         ( model, Effect.fromCmd clearUrl )



-- UPDATE


type Msg
    = Updated Field String
    | AttemptedSignIn
    | GoogleSignIn
    | FacebookSignIn
    | GotUser (Data User)
    | GotUserInfo (Result Http.Error UserInfo)


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
                state = "random string"
                redirectUri = loginUrl
                authorization =
                    { clientId = configuration.clientId
                    , redirectUri = redirectUri
                    , scope = configuration.scope
                    , state = Just state
                    , url = configuration.authorizationEndpoint
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
        
        GotUserInfo user ->
                    ( model
                    , Effect.none
                    )


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
            , div [ class "text-center"] [ button 
                [ onClick GoogleSignIn, class "btn-google" ] [ text "Sign in" ] ]
            ]
        , div [ class "container page" ]
            [ div [ class "row" ] []
            , div [ class "text-center"] [ button 
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
        ]

    }
