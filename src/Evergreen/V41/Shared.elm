module Evergreen.V41.Shared exposing (..)

import Evergreen.V41.Api.User
import Http


type alias Model =
    { user : Maybe Evergreen.V41.Api.User.User
    , random : Maybe String
    }


type Msg
    = ClickedSignOut
    | RandomSeedResult (Result Http.Error String)
    | SignedInUser Evergreen.V41.Api.User.User
