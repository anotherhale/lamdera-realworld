module Evergreen.V8.Shared exposing (..)

import Evergreen.V8.Api.User


type alias Model =
    { user : Maybe Evergreen.V8.Api.User.User
    }


type Msg
    = ClickedSignOut
    | SignedInUser Evergreen.V8.Api.User.User
