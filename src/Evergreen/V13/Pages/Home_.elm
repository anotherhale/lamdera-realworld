module Evergreen.V13.Pages.Home_ exposing (..)

import Evergreen.V13.Api.Article
import Evergreen.V13.Api.Data
import Evergreen.V13.Api.User


type alias Tag =
    String


type Tab
    = FeedFor Evergreen.V13.Api.User.User
    | Global
    | TagFilter Tag


type alias Model =
    { listing : Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Listing
    , page : Int
    , tags : Evergreen.V13.Api.Data.Data (List Tag)
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Listing)
    | GotTags (Evergreen.V13.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V13.Api.User.User Evergreen.V13.Api.Article.Article
    | ClickedUnfavorite Evergreen.V13.Api.User.User Evergreen.V13.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article)
