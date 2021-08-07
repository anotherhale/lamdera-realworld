module Evergreen.V6.Pages.Profile.Username_ exposing (..)

import Evergreen.V6.Api.Article
import Evergreen.V6.Api.Data
import Evergreen.V6.Api.Profile
import Evergreen.V6.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model = 
    { username : String
    , profile : (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Profile.Profile)
    , listing : (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Listing)
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Profile.Profile)
    | GotArticles (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V6.Api.User.User Evergreen.V6.Api.Article.Article
    | ClickedUnfavorite Evergreen.V6.Api.User.User Evergreen.V6.Api.Article.Article
    | UpdatedArticle (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)
    | ClickedFollow Evergreen.V6.Api.User.User Evergreen.V6.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V6.Api.User.User Evergreen.V6.Api.Profile.Profile
    | ClickedPage Int