module Evergreen.V37.Pages.Register exposing (..)

import Evergreen.V37.Api.Data
import Evergreen.V37.Api.User


type alias Model =
    { user : Evergreen.V37.Api.Data.Data Evergreen.V37.Api.User.User
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
    | GotUser (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.User.User)
