module Evergreen.V1.Pages.Login exposing (..)

import Evergreen.V1.Api.Data
import Evergreen.V1.Api.User
import Http


type alias Model = 
    { user : (Evergreen.V1.Api.Data.Data Evergreen.V1.Api.User.User)
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
    | GotUser (Evergreen.V1.Api.Data.Data Evergreen.V1.Api.User.User)
    | GotUserInfo (Result Http.Error UserInfo)