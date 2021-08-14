module Evergreen.V37.Pages.Profile.Username_ exposing (..)

import Evergreen.V37.Api.Article
import Evergreen.V37.Api.Data
import Evergreen.V37.Api.Profile
import Evergreen.V37.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model =
    { username : String
    , profile : Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Profile.Profile
    , listing : Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Listing
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Profile.Profile)
    | GotArticles (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V37.Api.User.User Evergreen.V37.Api.Article.Article
    | ClickedUnfavorite Evergreen.V37.Api.User.User Evergreen.V37.Api.Article.Article
    | UpdatedArticle (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article)
    | ClickedFollow Evergreen.V37.Api.User.User Evergreen.V37.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V37.Api.User.User Evergreen.V37.Api.Profile.Profile
    | ClickedPage Int
