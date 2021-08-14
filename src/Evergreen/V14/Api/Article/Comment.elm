module Evergreen.V14.Api.Article.Comment exposing (..)

import Evergreen.V14.Api.Profile
import Time


type alias Comment =
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V14.Api.Profile.Profile
    }
