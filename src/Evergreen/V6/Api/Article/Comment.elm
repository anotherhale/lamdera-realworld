module Evergreen.V6.Api.Article.Comment exposing (..)

import Evergreen.V6.Api.Profile
import Time


type alias Comment = 
    { id : Int
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , body : String
    , author : Evergreen.V6.Api.Profile.Profile
    }