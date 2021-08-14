module Evergreen.V37.Api.User exposing (..)

import Evergreen.V37.Api.Article


type alias Email =
    String


type alias User =
    { id : Int
    , email : Email
    , username : String
    , bio : Maybe String
    , image : String
    }


type alias UserId =
    Int


type alias UserFull =
    { id : Int
    , email : Email
    , username : String
    , bio : Maybe String
    , image : String
    , password : String
    , favorites : List Evergreen.V37.Api.Article.Slug
    , following : List UserId
    }
