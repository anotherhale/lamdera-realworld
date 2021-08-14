module Evergreen.V30.Pages.Login exposing (..)

import Evergreen.V30.Api.Data
import Evergreen.V30.Api.User
import Http


type alias Model = 
    { user : (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.User.User)
    , email : String
    , password : String
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
    | GotUser (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.User.User)
    | RandomSeedResult (Result Http.Error String)
    | Updated Field String