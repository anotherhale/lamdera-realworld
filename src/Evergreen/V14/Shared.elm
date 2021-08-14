module Evergreen.V14.Shared exposing (..)

import Evergreen.V14.Api.User


type alias Model =
    { user : Maybe Evergreen.V14.Api.User.User
    }


type Msg
    = ClickedSignOut
    | SignedInUser Evergreen.V14.Api.User.User
