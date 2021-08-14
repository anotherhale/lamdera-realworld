module Evergreen.V9.Shared exposing (..)

import Evergreen.V9.Api.User


type alias Model =
    { user : Maybe Evergreen.V9.Api.User.User
    }


type Msg
    = ClickedSignOut
    | SignedInUser Evergreen.V9.Api.User.User
