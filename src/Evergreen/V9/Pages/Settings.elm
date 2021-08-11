module Evergreen.V9.Pages.Settings exposing (..)

import Evergreen.V9.Api.Data
import Evergreen.V9.Api.User


type alias Model = 
    { image : String
    , username : String
    , bio : String
    , email : String
    , password : (Maybe String)
    , message : (Maybe String)
    , errors : (List String)
    }


type Field
    = Image
    | Username
    | Bio
    | Email
    | Password


type Msg
    = Updated Field String
    | SubmittedForm Evergreen.V9.Api.User.User
    | GotUser (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.User.User)