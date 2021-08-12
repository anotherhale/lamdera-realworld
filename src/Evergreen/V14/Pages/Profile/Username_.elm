module Evergreen.V14.Pages.Profile.Username_ exposing (..)

import Evergreen.V14.Api.Article
import Evergreen.V14.Api.Data
import Evergreen.V14.Api.Profile
import Evergreen.V14.Api.User


type Tab
    = MyArticles
    | FavoritedArticles


type alias Model = 
    { username : String
    , profile : (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Profile.Profile)
    , listing : (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Listing)
    , selectedTab : Tab
    , page : Int
    }


type Msg
    = GotProfile (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Profile.Profile)
    | GotArticles (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Listing)
    | Clicked Tab
    | ClickedFavorite Evergreen.V14.Api.User.User Evergreen.V14.Api.Article.Article
    | ClickedUnfavorite Evergreen.V14.Api.User.User Evergreen.V14.Api.Article.Article
    | UpdatedArticle (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article)
    | ClickedFollow Evergreen.V14.Api.User.User Evergreen.V14.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V14.Api.User.User Evergreen.V14.Api.Profile.Profile
    | ClickedPage Int