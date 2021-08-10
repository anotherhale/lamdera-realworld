module Evergreen.V8.Pages.Article.Slug_ exposing (..)

import Evergreen.V8.Api.Article
import Evergreen.V8.Api.Article.Comment
import Evergreen.V8.Api.Data
import Evergreen.V8.Api.Profile
import Evergreen.V8.Api.User


type alias Model = 
    { article : (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article)
    , comments : (Evergreen.V8.Api.Data.Data (List Evergreen.V8.Api.Article.Comment.Comment))
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article)
    | ClickedFavorite Evergreen.V8.Api.User.User Evergreen.V8.Api.Article.Article
    | ClickedUnfavorite Evergreen.V8.Api.User.User Evergreen.V8.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V8.Api.User.User Evergreen.V8.Api.Article.Article
    | DeletedArticle (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article)
    | GotAuthor (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Profile.Profile)
    | ClickedFollow Evergreen.V8.Api.User.User Evergreen.V8.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V8.Api.User.User Evergreen.V8.Api.Profile.Profile
    | GotComments (Evergreen.V8.Api.Data.Data (List Evergreen.V8.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V8.Api.User.User Evergreen.V8.Api.Article.Article Evergreen.V8.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V8.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V8.Api.User.User Evergreen.V8.Api.Article.Article
    | CreatedComment (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Comment.Comment)
    | UpdatedCommentText String