module Evergreen.V6.Pages.Article.Slug_ exposing (..)

import Evergreen.V6.Api.Article
import Evergreen.V6.Api.Article.Comment
import Evergreen.V6.Api.Data
import Evergreen.V6.Api.Profile
import Evergreen.V6.Api.User


type alias Model = 
    { article : (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)
    , comments : (Evergreen.V6.Api.Data.Data (List Evergreen.V6.Api.Article.Comment.Comment))
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)
    | ClickedFavorite Evergreen.V6.Api.User.User Evergreen.V6.Api.Article.Article
    | ClickedUnfavorite Evergreen.V6.Api.User.User Evergreen.V6.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V6.Api.User.User Evergreen.V6.Api.Article.Article
    | DeletedArticle (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)
    | GotAuthor (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Profile.Profile)
    | ClickedFollow Evergreen.V6.Api.User.User Evergreen.V6.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V6.Api.User.User Evergreen.V6.Api.Profile.Profile
    | GotComments (Evergreen.V6.Api.Data.Data (List Evergreen.V6.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V6.Api.User.User Evergreen.V6.Api.Article.Article Evergreen.V6.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V6.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V6.Api.User.User Evergreen.V6.Api.Article.Article
    | CreatedComment (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Comment.Comment)
    | UpdatedCommentText String