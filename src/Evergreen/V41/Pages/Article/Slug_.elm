module Evergreen.V41.Pages.Article.Slug_ exposing (..)

import Evergreen.V41.Api.Article
import Evergreen.V41.Api.Article.Comment
import Evergreen.V41.Api.Data
import Evergreen.V41.Api.Profile
import Evergreen.V41.Api.User


type alias Model =
    { article : Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article
    , comments : Evergreen.V41.Api.Data.Data (List Evergreen.V41.Api.Article.Comment.Comment)
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article)
    | ClickedFavorite Evergreen.V41.Api.User.User Evergreen.V41.Api.Article.Article
    | ClickedUnfavorite Evergreen.V41.Api.User.User Evergreen.V41.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V41.Api.User.User Evergreen.V41.Api.Article.Article
    | DeletedArticle (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article)
    | GotAuthor (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Profile.Profile)
    | ClickedFollow Evergreen.V41.Api.User.User Evergreen.V41.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V41.Api.User.User Evergreen.V41.Api.Profile.Profile
    | GotComments (Evergreen.V41.Api.Data.Data (List Evergreen.V41.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V41.Api.User.User Evergreen.V41.Api.Article.Article Evergreen.V41.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V41.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V41.Api.User.User Evergreen.V41.Api.Article.Article
    | CreatedComment (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Comment.Comment)
    | UpdatedCommentText String
