module Evergreen.V8.Pages.Register exposing (..)

import Evergreen.V8.Api.Data
import Evergreen.V8.Api.User


type alias Model =
    { user : Evergreen.V8.Api.Data.Data Evergreen.V8.Api.User.User
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
    | GotUser (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.User.User)
