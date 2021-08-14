module Evergreen.V9.Pages.Article.Slug_ exposing (..)

import Evergreen.V9.Api.Article
import Evergreen.V9.Api.Article.Comment
import Evergreen.V9.Api.Data
import Evergreen.V9.Api.Profile
import Evergreen.V9.Api.User


type alias Model =
    { article : Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article
    , comments : Evergreen.V9.Api.Data.Data (List Evergreen.V9.Api.Article.Comment.Comment)
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article)
    | ClickedFavorite Evergreen.V9.Api.User.User Evergreen.V9.Api.Article.Article
    | ClickedUnfavorite Evergreen.V9.Api.User.User Evergreen.V9.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V9.Api.User.User Evergreen.V9.Api.Article.Article
    | DeletedArticle (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article)
    | GotAuthor (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Profile.Profile)
    | ClickedFollow Evergreen.V9.Api.User.User Evergreen.V9.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V9.Api.User.User Evergreen.V9.Api.Profile.Profile
    | GotComments (Evergreen.V9.Api.Data.Data (List Evergreen.V9.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V9.Api.User.User Evergreen.V9.Api.Article.Article Evergreen.V9.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V9.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V9.Api.User.User Evergreen.V9.Api.Article.Article
    | CreatedComment (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Comment.Comment)
    | UpdatedCommentText String
