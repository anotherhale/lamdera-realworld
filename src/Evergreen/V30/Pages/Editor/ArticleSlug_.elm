module Evergreen.V30.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V30.Api.Article
import Evergreen.V30.Api.Data
import Evergreen.V30.Api.User
import Evergreen.V30.Components.Editor


type alias Model = 
    { slug : String
    , form : (Maybe Evergreen.V30.Components.Editor.Form)
    , article : (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)
    }


type Msg
    = SubmittedForm Evergreen.V30.Api.User.User Evergreen.V30.Components.Editor.Form
    | Updated Evergreen.V30.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)