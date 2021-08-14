module Evergreen.V13.Pages.Login exposing (..)

import Evergreen.V13.Api.Data
import Evergreen.V13.Api.User
import Http


type alias Model =
    { user : Evergreen.V13.Api.Data.Data Evergreen.V13.Api.User.User
    , email : String
    , password : String
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
    | GotGoogleUserInfo (Result Http.Error UserInfo)
    | GotUser (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.User.User)
    | Updated Field String
