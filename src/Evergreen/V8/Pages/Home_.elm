module Evergreen.V8.Pages.Home_ exposing (..)

import Evergreen.V8.Api.Article
import Evergreen.V8.Api.Data
import Evergreen.V8.Api.User


type alias Tag = String


type Tab
    = FeedFor Evergreen.V8.Api.User.User
    | Global
    | TagFilter Tag


type alias Model = 
    { listing : (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Listing)
    , page : Int
    , tags : (Evergreen.V8.Api.Data.Data (List Tag))
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Listing)
    | GotTags (Evergreen.V8.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V8.Api.User.User Evergreen.V8.Api.Article.Article
    | ClickedUnfavorite Evergreen.V8.Api.User.User Evergreen.V8.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article)