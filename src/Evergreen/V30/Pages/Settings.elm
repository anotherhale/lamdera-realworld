module Evergreen.V30.Pages.Settings exposing (..)

import Evergreen.V30.Api.Data
import Evergreen.V30.Api.User


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
    | SubmittedForm Evergreen.V30.Api.User.User
    | GotUser (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.User.User)
