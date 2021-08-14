module Evergreen.V41.Pages.Register exposing (..)

import Evergreen.V41.Api.Data
import Evergreen.V41.Api.User


type alias Model =
    { user : Evergreen.V41.Api.Data.Data Evergreen.V41.Api.User.User
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
    | GotUser (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.User.User)
