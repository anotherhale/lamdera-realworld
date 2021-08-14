module Evergreen.V14.Pages.Login exposing (..)

import Evergreen.V14.Api.Data
import Evergreen.V14.Api.User
import Http


type alias Model =
    { user : Evergreen.V14.Api.Data.Data Evergreen.V14.Api.User.User
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
    | GotUser (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.User.User)
    | RandomSeedResult (Result Http.Error String)
    | Updated Field String
