module Evergreen.V9.Api.Article.Comment exposing (..)

import Evergreen.V9.Api.Profile
import Time


type alias Comment =
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V9.Api.Profile.Profile
    }
