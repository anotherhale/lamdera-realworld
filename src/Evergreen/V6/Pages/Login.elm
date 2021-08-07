module Evergreen.V6.Pages.Login exposing (..)

import Evergreen.V6.Api.Data
import Evergreen.V6.Api.User
import Http


type alias Model = 
    { user : (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.User.User)
    , email : String
    , password : String
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
    | GotUser (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.User.User)
    | GotGoogleUserInfo (Result Http.Error UserInfo)