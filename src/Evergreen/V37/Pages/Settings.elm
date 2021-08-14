module Evergreen.V37.Pages.Settings exposing (..)

import Evergreen.V37.Api.Data
import Evergreen.V37.Api.User


type alias Model =
    { image : String
    , username : String
    , bio : String
    , email : String
    , password : Maybe String
    , message : Maybe String
    , errors : List String
    }


type Field
    = Image
    | Username
    | Bio
    | Email
    | Password


type Msg
    = Updated Field String
    | SubmittedForm Evergreen.V37.Api.User.User
    | GotUser (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.User.User)
