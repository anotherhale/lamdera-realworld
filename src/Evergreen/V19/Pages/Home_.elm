module Evergreen.V19.Pages.Home_ exposing (..)

import Evergreen.V19.Api.Article
import Evergreen.V19.Api.Data
import Evergreen.V19.Api.User


type alias Tag = String


type Tab
    = FeedFor Evergreen.V19.Api.User.User
    | Global
    | TagFilter Tag


type alias Model = 
    { listing : (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Listing)
    , page : Int
    , tags : (Evergreen.V19.Api.Data.Data (List Tag))
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Listing)
    | GotTags (Evergreen.V19.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V19.Api.User.User Evergreen.V19.Api.Article.Article
    | ClickedUnfavorite Evergreen.V19.Api.User.User Evergreen.V19.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article)