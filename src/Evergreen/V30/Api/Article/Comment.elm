module Evergreen.V30.Api.Article.Comment exposing (..)

import Evergreen.V30.Api.Profile
import Time


type alias Comment = 
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V30.Api.Profile.Profile
    }