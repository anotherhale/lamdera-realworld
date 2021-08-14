module Evergreen.V30.Pages.Home_ exposing (..)

import Evergreen.V30.Api.Article
import Evergreen.V30.Api.Data
import Evergreen.V30.Api.User


type alias Tag = String


type Tab
    = FeedFor Evergreen.V30.Api.User.User
    | Global
    | TagFilter Tag


type alias Model = 
    { listing : (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Listing)
    , page : Int
    , tags : (Evergreen.V30.Api.Data.Data (List Tag))
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Listing)
    | GotTags (Evergreen.V30.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V30.Api.User.User Evergreen.V30.Api.Article.Article
    | ClickedUnfavorite Evergreen.V30.Api.User.User Evergreen.V30.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)