module Evergreen.V8.Pages.Profile.Username_ exposing (..)

import Evergreen.V8.Api.Article
import Evergreen.V8.Api.Data
import Evergreen.V8.Api.Profile
import Evergreen.V8.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model = 
    { username : String
    , profile : (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Profile.Profile)
    , listing : (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Listing)
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Profile.Profile)
    | GotArticles (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V8.Api.User.User Evergreen.V8.Api.Article.Article
    | ClickedUnfavorite Evergreen.V8.Api.User.User Evergreen.V8.Api.Article.Article
    | UpdatedArticle (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article)
    | ClickedFollow Evergreen.V8.Api.User.User Evergreen.V8.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V8.Api.User.User Evergreen.V8.Api.Profile.Profile
    | ClickedPage Int