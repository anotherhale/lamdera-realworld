module Evergreen.V19.Pages.Profile.Username_ exposing (..)

import Evergreen.V19.Api.Article
import Evergreen.V19.Api.Data
import Evergreen.V19.Api.Profile
import Evergreen.V19.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model =
    { username : String
    , profile : Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Profile.Profile
    , listing : Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Listing
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Profile.Profile)
    | GotArticles (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V19.Api.User.User Evergreen.V19.Api.Article.Article
    | ClickedUnfavorite Evergreen.V19.Api.User.User Evergreen.V19.Api.Article.Article
    | UpdatedArticle (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article)
    | ClickedFollow Evergreen.V19.Api.User.User Evergreen.V19.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V19.Api.User.User Evergreen.V19.Api.Profile.Profile
    | ClickedPage Int
