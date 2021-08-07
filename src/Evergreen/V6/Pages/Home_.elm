module Evergreen.V6.Pages.Home_ exposing (..)

import Evergreen.V6.Api.Article
import Evergreen.V6.Api.Data
import Evergreen.V6.Api.User


type alias Tag = String


type Tab
    = FeedFor Evergreen.V6.Api.User.User
    | Global
    | TagFilter Tag


type alias Model = 
    { listing : (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Listing)
    , page : Int
    , tags : (Evergreen.V6.Api.Data.Data (List Tag))
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Listing)
    | GotTags (Evergreen.V6.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V6.Api.User.User Evergreen.V6.Api.Article.Article
    | ClickedUnfavorite Evergreen.V6.Api.User.User Evergreen.V6.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)