module Evergreen.V42.Api.Article.Comment exposing (..)

import Evergreen.V42.Api.Profile
import Time


type alias Comment =
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V42.Api.Profile.Profile
    }
