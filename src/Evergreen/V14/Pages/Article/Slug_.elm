module Evergreen.V14.Pages.Article.Slug_ exposing (..)

import Evergreen.V14.Api.Article
import Evergreen.V14.Api.Article.Comment
import Evergreen.V14.Api.Data
import Evergreen.V14.Api.Profile
import Evergreen.V14.Api.User


type alias Model = 
    { article : (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article)
    , comments : (Evergreen.V14.Api.Data.Data (List Evergreen.V14.Api.Article.Comment.Comment))
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article)
    | ClickedFavorite Evergreen.V14.Api.User.User Evergreen.V14.Api.Article.Article
    | ClickedUnfavorite Evergreen.V14.Api.User.User Evergreen.V14.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V14.Api.User.User Evergreen.V14.Api.Article.Article
    | DeletedArticle (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article)
    | GotAuthor (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Profile.Profile)
    | ClickedFollow Evergreen.V14.Api.User.User Evergreen.V14.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V14.Api.User.User Evergreen.V14.Api.Profile.Profile
    | GotComments (Evergreen.V14.Api.Data.Data (List Evergreen.V14.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V14.Api.User.User Evergreen.V14.Api.Article.Article Evergreen.V14.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V14.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V14.Api.User.User Evergreen.V14.Api.Article.Article
    | CreatedComment (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Comment.Comment)
    | UpdatedCommentText String