module Evergreen.V41.Pages.Home_ exposing (..)

import Evergreen.V41.Api.Article
import Evergreen.V41.Api.Data
import Evergreen.V41.Api.User


type alias Tag =
    String


type Tab
    = FeedFor Evergreen.V41.Api.User.User
    | Global
    | TagFilter Tag


type alias Model =
    { listing : Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Listing
    , page : Int
    , tags : Evergreen.V41.Api.Data.Data (List Tag)
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Listing)
    | GotTags (Evergreen.V41.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V41.Api.User.User Evergreen.V41.Api.Article.Article
    | ClickedUnfavorite Evergreen.V41.Api.User.User Evergreen.V41.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article)
