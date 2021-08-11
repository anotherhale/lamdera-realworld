module Evergreen.V13.Pages.Article.Slug_ exposing (..)

import Evergreen.V13.Api.Article
import Evergreen.V13.Api.Article.Comment
import Evergreen.V13.Api.Data
import Evergreen.V13.Api.Profile
import Evergreen.V13.Api.User


type alias Model = 
    { article : (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article)
    , comments : (Evergreen.V13.Api.Data.Data (List Evergreen.V13.Api.Article.Comment.Comment))
    , commentText : String
    }


type Msg
    = GotArticle (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article)
    | ClickedFavorite Evergreen.V13.Api.User.User Evergreen.V13.Api.Article.Article
    | ClickedUnfavorite Evergreen.V13.Api.User.User Evergreen.V13.Api.Article.Article
    | ClickedDeleteArticle Evergreen.V13.Api.User.User Evergreen.V13.Api.Article.Article
    | DeletedArticle (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article)
    | GotAuthor (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Profile.Profile)
    | ClickedFollow Evergreen.V13.Api.User.User Evergreen.V13.Api.Profile.Profile
    | ClickedUnfollow Evergreen.V13.Api.User.User Evergreen.V13.Api.Profile.Profile
    | GotComments (Evergreen.V13.Api.Data.Data (List Evergreen.V13.Api.Article.Comment.Comment))
    | ClickedDeleteComment Evergreen.V13.Api.User.User Evergreen.V13.Api.Article.Article Evergreen.V13.Api.Article.Comment.Comment
    | DeletedComment (Evergreen.V13.Api.Data.Data Int)
    | SubmittedCommentForm Evergreen.V13.Api.User.User Evergreen.V13.Api.Article.Article
    | CreatedComment (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Comment.Comment)
    | UpdatedCommentText String