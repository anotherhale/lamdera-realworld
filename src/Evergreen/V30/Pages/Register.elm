module Evergreen.V30.Pages.Register exposing (..)

import Evergreen.V30.Api.Data
import Evergreen.V30.Api.User


type alias Model = 
    { user : (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.User.User)
    , username : String
    , email : String
    , password : String
    }


type Field
    = Username
    | Email
    | Password


type Msg
    = Updated Field String
    | AttemptedSignUp
    | GotUser (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.User.User)