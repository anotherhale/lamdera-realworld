module Evergreen.V8.Pages.Login exposing (..)

import Evergreen.V8.Api.Data
import Evergreen.V8.Api.User
import Http


type alias Model =
    { user : Evergreen.V8.Api.Data.Data Evergreen.V8.Api.User.User
    , email : String
    , password : String
    , error : Maybe String
    , message : Maybe String
    }


type Field
    = Email
    | Password


type alias UserInfo =
    { id : String
    , email : String
    , name : String
    , picture : String
    }


type Msg
    = Updated Field String
    | AttemptedSignIn
    | GoogleSignIn
    | FacebookSignIn
    | GotUser (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.User.User)
    | GotGoogleUserInfo (Result Http.Error UserInfo)
