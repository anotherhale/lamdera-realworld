module Evergreen.V9.Api.Article exposing (..)

import Evergreen.V9.Api.Profile
import Time


type alias Slug =
    String


type alias Article =
    { slug : Slug
    , title : String
    , description : String
    , body : String
    , tags : List String
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , favorited : Bool
    , favoritesCount : Int
    , author : Evergreen.V9.Api.Profile.Profile
    }


type alias Listing =
    { articles : List Article
    , page : Int
    , totalPages : Int
    }


type alias ArticleStore =
    { slug : Slug
    , title : String
    , description : String
    , body : String
    , tags : List String
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    , userId : Int
    }
