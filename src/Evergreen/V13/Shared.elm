module Evergreen.V13.Shared exposing (..)

import Evergreen.V13.Api.User


type alias Model =
    { user : Maybe Evergreen.V13.Api.User.User
    }


type Msg
    = ClickedSignOut
    | SignedInUser Evergreen.V13.Api.User.User
