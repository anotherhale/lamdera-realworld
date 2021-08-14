module Evergreen.V42.Pages.Article.Slug_ exposing (..)

import Evergreen.V42.Api.Article
import Evergreen.V42.Api.Article.Comment
import Evergreen.V42.Api.Data
import Evergreen.V42.Api.Profile
import Evergreen.V42.Api.User


type alias Model =
    { article : Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article
    , comments : Evergreen.V42.Api.Data.Data (List Evergreen.V42.Api.Article.Comment.Comment)
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article)
    | ClickedFavorite Evergreen.V42.Api.User.User Evergreen.V42.Api.Article.Article
    | ClickedUnfavorite Evergreen.V42.Api.User.User Evergreen.V42.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V42.Api.User.User Evergreen.V42.Api.Article.Article
    | DeletedArticle (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article)
    | GotAuthor (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Profile.Profile)
    | ClickedFollow Evergreen.V42.Api.User.User Evergreen.V42.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V42.Api.User.User Evergreen.V42.Api.Profile.Profile
    | GotComments (Evergreen.V42.Api.Data.Data (List Evergreen.V42.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V42.Api.User.User Evergreen.V42.Api.Article.Article Evergreen.V42.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V42.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V42.Api.User.User Evergreen.V42.Api.Article.Article
    | CreatedComment (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Comment.Comment)
    | UpdatedCommentText String
