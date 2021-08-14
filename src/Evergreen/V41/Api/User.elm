module Evergreen.V41.Api.User exposing (..)

import Evergreen.V41.Api.Article


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
    , favorites : List Evergreen.V41.Api.Article.Slug
    , following : List UserId
    }
