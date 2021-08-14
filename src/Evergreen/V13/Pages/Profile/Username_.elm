module Evergreen.V13.Pages.Profile.Username_ exposing (..)

import Evergreen.V13.Api.Article
import Evergreen.V13.Api.Data
import Evergreen.V13.Api.Profile
import Evergreen.V13.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model =
    { username : String
    , profile : Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Profile.Profile
    , listing : Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Listing
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Profile.Profile)
    | GotArticles (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V13.Api.User.User Evergreen.V13.Api.Article.Article
    | ClickedUnfavorite Evergreen.V13.Api.User.User Evergreen.V13.Api.Article.Article
    | UpdatedArticle (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article)
    | ClickedFollow Evergreen.V13.Api.User.User Evergreen.V13.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V13.Api.User.User Evergreen.V13.Api.Profile.Profile
    | ClickedPage Int
