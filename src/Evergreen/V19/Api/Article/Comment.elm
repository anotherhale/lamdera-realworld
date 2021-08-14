module Evergreen.V19.Api.Article.Comment exposing (..)

import Evergreen.V19.Api.Profile
import Time


type alias Comment = 
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V19.Api.Profile.Profile
    }