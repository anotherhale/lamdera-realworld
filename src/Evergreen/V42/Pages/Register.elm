module Evergreen.V42.Pages.Register exposing (..)

import Evergreen.V42.Api.Data
import Evergreen.V42.Api.User


type alias Model =
    { user : Evergreen.V42.Api.Data.Data Evergreen.V42.Api.User.User
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
    | GotUser (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.User.User)
