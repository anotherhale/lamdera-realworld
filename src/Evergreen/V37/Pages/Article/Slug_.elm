module Evergreen.V37.Pages.Article.Slug_ exposing (..)

import Evergreen.V37.Api.Article
import Evergreen.V37.Api.Article.Comment
import Evergreen.V37.Api.Data
import Evergreen.V37.Api.Profile
import Evergreen.V37.Api.User


type alias Model =
    { article : Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article
    , comments : Evergreen.V37.Api.Data.Data (List Evergreen.V37.Api.Article.Comment.Comment)
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article)
    | ClickedFavorite Evergreen.V37.Api.User.User Evergreen.V37.Api.Article.Article
    | ClickedUnfavorite Evergreen.V37.Api.User.User Evergreen.V37.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V37.Api.User.User Evergreen.V37.Api.Article.Article
    | DeletedArticle (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article)
    | GotAuthor (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Profile.Profile)
    | ClickedFollow Evergreen.V37.Api.User.User Evergreen.V37.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V37.Api.User.User Evergreen.V37.Api.Profile.Profile
    | GotComments (Evergreen.V37.Api.Data.Data (List Evergreen.V37.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V37.Api.User.User Evergreen.V37.Api.Article.Article Evergreen.V37.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V37.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V37.Api.User.User Evergreen.V37.Api.Article.Article
    | CreatedComment (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Comment.Comment)
    | UpdatedCommentText String
