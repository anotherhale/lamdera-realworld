module Evergreen.V9.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V9.Api.Article
import Evergreen.V9.Api.Data
import Evergreen.V9.Api.User
import Evergreen.V9.Components.Editor


type alias Model = 
    { slug : String
    , form : (Maybe Evergreen.V9.Components.Editor.Form)
    , article : (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article)
    }


type Msg
    = SubmittedForm Evergreen.V9.Api.User.User Evergreen.V9.Components.Editor.Form
    | Updated Evergreen.V9.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article)