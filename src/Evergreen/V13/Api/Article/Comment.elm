module Evergreen.V13.Api.Article.Comment exposing (..)

import Evergreen.V13.Api.Profile
import Time


type alias Comment = 
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V13.Api.Profile.Profile
    }