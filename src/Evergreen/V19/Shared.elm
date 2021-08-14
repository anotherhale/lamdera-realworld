module Evergreen.V19.Shared exposing (..)

import Evergreen.V19.Api.User


type alias Model =
    { user : Maybe Evergreen.V19.Api.User.User
    }


type Msg
    = ClickedSignOut
    | SignedInUser Evergreen.V19.Api.User.User
