module Evergreen.V37.Pages.Home_ exposing (..)

import Evergreen.V37.Api.Article
import Evergreen.V37.Api.Data
import Evergreen.V37.Api.User


type alias Tag =
    String


type Tab
    = FeedFor Evergreen.V37.Api.User.User
    | Global
    | TagFilter Tag


type alias Model =
    { listing : Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Listing
    , page : Int
    , tags : Evergreen.V37.Api.Data.Data (List Tag)
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Listing)
    | GotTags (Evergreen.V37.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V37.Api.User.User Evergreen.V37.Api.Article.Article
    | ClickedUnfavorite Evergreen.V37.Api.User.User Evergreen.V37.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article)
