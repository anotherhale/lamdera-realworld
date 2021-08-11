module Evergreen.V9.Pages.Profile.Username_ exposing (..)

import Evergreen.V9.Api.Article
import Evergreen.V9.Api.Data
import Evergreen.V9.Api.Profile
import Evergreen.V9.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model = 
    { username : String
    , profile : (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Profile.Profile)
    , listing : (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Listing)
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Profile.Profile)
    | GotArticles (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V9.Api.User.User Evergreen.V9.Api.Article.Article
    | ClickedUnfavorite Evergreen.V9.Api.User.User Evergreen.V9.Api.Article.Article
    | UpdatedArticle (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article)
    | ClickedFollow Evergreen.V9.Api.User.User Evergreen.V9.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V9.Api.User.User Evergreen.V9.Api.Profile.Profile
    | ClickedPage Int