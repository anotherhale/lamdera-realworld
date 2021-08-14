module Evergreen.V37.Shared exposing (..)

import Evergreen.V37.Api.User


type alias Model =
    { user : Maybe Evergreen.V37.Api.User.User
    }


type Msg
    = ClickedSignOut
    | SignedInUser Evergreen.V37.Api.User.User
