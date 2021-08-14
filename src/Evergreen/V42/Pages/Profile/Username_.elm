module Evergreen.V42.Pages.Profile.Username_ exposing (..)

import Evergreen.V42.Api.Article
import Evergreen.V42.Api.Data
import Evergreen.V42.Api.Profile
import Evergreen.V42.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model =
    { username : String
    , profile : Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Profile.Profile
    , listing : Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Listing
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Profile.Profile)
    | GotArticles (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V42.Api.User.User Evergreen.V42.Api.Article.Article
    | ClickedUnfavorite Evergreen.V42.Api.User.User Evergreen.V42.Api.Article.Article
    | UpdatedArticle (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article)
    | ClickedFollow Evergreen.V42.Api.User.User Evergreen.V42.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V42.Api.User.User Evergreen.V42.Api.Profile.Profile
    | ClickedPage Int
