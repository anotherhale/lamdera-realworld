module Evergreen.V30.Shared exposing (..)

import Evergreen.V30.Api.User


type alias Model = 
    { user : (Maybe Evergreen.V30.Api.User.User)
    }


type Msg
    = ClickedSignOut
    | SignedInUser Evergreen.V30.Api.User.User