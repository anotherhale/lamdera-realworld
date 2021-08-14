module Evergreen.V14.Pages.Home_ exposing (..)

import Evergreen.V14.Api.Article
import Evergreen.V14.Api.Data
import Evergreen.V14.Api.User


type alias Tag =
    String


type Tab
    = FeedFor Evergreen.V14.Api.User.User
    | Global
    | TagFilter Tag


type alias Model =
    { listing : Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Listing
    , page : Int
    , tags : Evergreen.V14.Api.Data.Data (List Tag)
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Listing)
    | GotTags (Evergreen.V14.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V14.Api.User.User Evergreen.V14.Api.Article.Article
    | ClickedUnfavorite Evergreen.V14.Api.User.User Evergreen.V14.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article)
