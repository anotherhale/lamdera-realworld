module Evergreen.V8.Api.Article.Comment exposing (..)

import Evergreen.V8.Api.Profile
import Time


type alias Comment =
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V8.Api.Profile.Profile
    }
