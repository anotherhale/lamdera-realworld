module Evergreen.V2.Pages.Login exposing (..)

import Evergreen.V2.Api.Data
import Evergreen.V2.Api.User
import Http


type alias Model =
    { user : Evergreen.V2.Api.Data.Data Evergreen.V2.Api.User.User
    , email : String
    , password : String
    , error : Maybe String
    , message : Maybe String
    }


type Field
    = Email
    | Password


type alias UserInfo =
    { name : String
    , picture : String
    }


type Msg
    = Updated Field String
    | AttemptedSignIn
    | GoogleSignIn
    | FacebookSignIn
    | GotUser (Evergreen.V2.Api.Data.Data Evergreen.V2.Api.User.User)
    | GotGoogleUserInfo (Result Http.Error UserInfo)
