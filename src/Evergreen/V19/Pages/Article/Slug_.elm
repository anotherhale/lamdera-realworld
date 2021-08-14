module Evergreen.V19.Pages.Article.Slug_ exposing (..)

import Evergreen.V19.Api.Article
import Evergreen.V19.Api.Article.Comment
import Evergreen.V19.Api.Data
import Evergreen.V19.Api.Profile
import Evergreen.V19.Api.User


type alias Model =
    { article : Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article
    , comments : Evergreen.V19.Api.Data.Data (List Evergreen.V19.Api.Article.Comment.Comment)
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article)
    | ClickedFavorite Evergreen.V19.Api.User.User Evergreen.V19.Api.Article.Article
    | ClickedUnfavorite Evergreen.V19.Api.User.User Evergreen.V19.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V19.Api.User.User Evergreen.V19.Api.Article.Article
    | DeletedArticle (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article)
    | GotAuthor (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Profile.Profile)
    | ClickedFollow Evergreen.V19.Api.User.User Evergreen.V19.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V19.Api.User.User Evergreen.V19.Api.Profile.Profile
    | GotComments (Evergreen.V19.Api.Data.Data (List Evergreen.V19.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V19.Api.User.User Evergreen.V19.Api.Article.Article Evergreen.V19.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V19.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V19.Api.User.User Evergreen.V19.Api.Article.Article
    | CreatedComment (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Comment.Comment)
    | UpdatedCommentText String
