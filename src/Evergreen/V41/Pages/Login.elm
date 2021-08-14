module Evergreen.V41.Pages.Login exposing (..)

import Evergreen.V41.Api.Data
import Evergreen.V41.Api.User
import Http


type alias Model =
    { user : Evergreen.V41.Api.Data.Data Evergreen.V41.Api.User.User
    , email : String
    , password : String
    , message : String
    , random : String
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
    | GotUser (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.User.User)
    | Updated Field String
