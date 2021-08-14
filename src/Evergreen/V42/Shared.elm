module Evergreen.V42.Shared exposing (..)

import Evergreen.V42.Api.User
import Http


type alias Model =
    { user : Maybe Evergreen.V42.Api.User.User
    , random : Maybe String
    }


type Msg
    = ClickedSignOut
    | RandomSeedResult (Result Http.Error String)
    | SignedInUser Evergreen.V42.Api.User.User
