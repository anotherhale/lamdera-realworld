module Evergreen.V37.Api.Article.Comment exposing (..)

import Evergreen.V37.Api.Profile
import Time


type alias Comment =
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V37.Api.Profile.Profile
    }
