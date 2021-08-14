module Evergreen.V42.Pages.Login exposing (..)

import Evergreen.V42.Api.Data
import Evergreen.V42.Api.User
import Http


type alias Model =
    { user : Evergreen.V42.Api.Data.Data Evergreen.V42.Api.User.User
    , email : String
    , password : String
    , message : String
    , random : Maybe String
    }


type alias UserInfo =
    { id : String
    , email : String
    , name : String
    , picture : String
    }


type Field
    = Email
    | Password


type Msg
    = AttemptedSignIn
    | FacebookSignIn
    | GoogleSignIn
    | GotOauthUserInfo (Result Http.Error UserInfo)
    | GotUser (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.User.User)
    | Updated Field String
