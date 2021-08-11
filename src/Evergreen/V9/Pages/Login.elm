module Evergreen.V9.Pages.Login exposing (..)

import Evergreen.V9.Api.Data
import Evergreen.V9.Api.User
import Http


type alias Model = 
    { user : (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.User.User)
    , email : String
    , password : String
    , error : (Maybe String)
    , message : (Maybe String)
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
    | GotUser (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.User.User)
    | Updated Field String