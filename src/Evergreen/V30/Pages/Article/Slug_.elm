module Evergreen.V30.Pages.Article.Slug_ exposing (..)

import Evergreen.V30.Api.Article
import Evergreen.V30.Api.Article.Comment
import Evergreen.V30.Api.Data
import Evergreen.V30.Api.Profile
import Evergreen.V30.Api.User


type alias Model = 
    { article : (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)
    , comments : (Evergreen.V30.Api.Data.Data (List Evergreen.V30.Api.Article.Comment.Comment))
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)
    | ClickedFavorite Evergreen.V30.Api.User.User Evergreen.V30.Api.Article.Article
    | ClickedUnfavorite Evergreen.V30.Api.User.User Evergreen.V30.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V30.Api.User.User Evergreen.V30.Api.Article.Article
    | DeletedArticle (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)
    | GotAuthor (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Profile.Profile)
    | ClickedFollow Evergreen.V30.Api.User.User Evergreen.V30.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V30.Api.User.User Evergreen.V30.Api.Profile.Profile
    | GotComments (Evergreen.V30.Api.Data.Data (List Evergreen.V30.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V30.Api.User.User Evergreen.V30.Api.Article.Article Evergreen.V30.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V30.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V30.Api.User.User Evergreen.V30.Api.Article.Article
    | CreatedComment (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Comment.Comment)
    | UpdatedCommentText String