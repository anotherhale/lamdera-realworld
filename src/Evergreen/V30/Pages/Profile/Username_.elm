module Evergreen.V30.Pages.Profile.Username_ exposing (..)

import Evergreen.V30.Api.Article
import Evergreen.V30.Api.Data
import Evergreen.V30.Api.Profile
import Evergreen.V30.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model = 
    { username : String
    , profile : (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Profile.Profile)
    , listing : (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Listing)
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Profile.Profile)
    | GotArticles (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V30.Api.User.User Evergreen.V30.Api.Article.Article
    | ClickedUnfavorite Evergreen.V30.Api.User.User Evergreen.V30.Api.Article.Article
    | UpdatedArticle (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)
    | ClickedFollow Evergreen.V30.Api.User.User Evergreen.V30.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V30.Api.User.User Evergreen.V30.Api.Profile.Profile
    | ClickedPage Int