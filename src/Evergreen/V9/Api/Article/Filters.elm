module Evergreen.V9.Api.Article.Filters exposing (..)

type Filters
    = Filters 
    { tag : (Maybe String)
    , author : (Maybe String)
    , favorited : (Maybe String)
    }