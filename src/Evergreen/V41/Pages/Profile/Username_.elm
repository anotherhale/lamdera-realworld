module Evergreen.V41.Pages.Profile.Username_ exposing (..)

import Evergreen.V41.Api.Article
import Evergreen.V41.Api.Data
import Evergreen.V41.Api.Profile
import Evergreen.V41.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model =
    { username : String
    , profile : Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Profile.Profile
    , listing : Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Listing
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Profile.Profile)
    | GotArticles (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V41.Api.User.User Evergreen.V41.Api.Article.Article
    | ClickedUnfavorite Evergreen.V41.Api.User.User Evergreen.V41.Api.Article.Article
    | UpdatedArticle (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article)
    | ClickedFollow Evergreen.V41.Api.User.User Evergreen.V41.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V41.Api.User.User Evergreen.V41.Api.Profile.Profile
    | ClickedPage Int
