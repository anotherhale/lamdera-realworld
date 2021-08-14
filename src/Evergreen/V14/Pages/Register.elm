module Evergreen.V14.Pages.Register exposing (..)

import Evergreen.V14.Api.Data
import Evergreen.V14.Api.User


type alias Model =
    { user : Evergreen.V14.Api.Data.Data Evergreen.V14.Api.User.User
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
    | GotUser (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.User.User)
