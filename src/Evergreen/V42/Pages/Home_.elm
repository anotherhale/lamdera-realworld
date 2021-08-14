module Evergreen.V42.Pages.Home_ exposing (..)

import Evergreen.V42.Api.Article
import Evergreen.V42.Api.Data
import Evergreen.V42.Api.User


type alias Tag =
    String


type Tab
    = FeedFor Evergreen.V42.Api.User.User
    | Global
    | TagFilter Tag


type alias Model =
    { listing : Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Listing
    , page : Int
    , tags : Evergreen.V42.Api.Data.Data (List Tag)
    , activeTab : Tab
    }


type Msg
    = GotArticles (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Listing)
    | GotTags (Evergreen.V42.Api.Data.Data (List Tag))
    | SelectedTab Tab
    | ClickedFavorite Evergreen.V42.Api.User.User Evergreen.V42.Api.Article.Article
    | ClickedUnfavorite Evergreen.V42.Api.User.User Evergreen.V42.Api.Article.Article
    | ClickedPage Int
    | UpdatedArticle (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article)
