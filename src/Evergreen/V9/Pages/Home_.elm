module Evergreen.V9.Pages.Home_ exposing (..)

import Evergreen.V9.Api.Article
import Evergreen.V9.Api.Data
import Evergreen.V9.Api.User


type alias Tag = String


type Tab
    = FeedFor Evergreen.V9.Api.User.User
    | Global
    | TagFilter Tag


type alias Model = 
    { listing : (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Listing)
    , page : Int
    , tags : (Evergreen.V9.Api.Data.Data (List Tag))
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Listing)
    | GotTags (Evergreen.V9.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V9.Api.User.User Evergreen.V9.Api.Article.Article
    | ClickedUnfavorite Evergreen.V9.Api.User.User Evergreen.V9.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article)