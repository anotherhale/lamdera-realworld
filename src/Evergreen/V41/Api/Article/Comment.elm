module Evergreen.V41.Api.Article.Comment exposing (..)

import Evergreen.V41.Api.Profile
import Time


type alias Comment =
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V41.Api.Profile.Profile
    }
