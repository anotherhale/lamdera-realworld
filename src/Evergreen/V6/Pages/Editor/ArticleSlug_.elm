module Evergreen.V6.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V6.Api.Article
import Evergreen.V6.Api.Data
import Evergreen.V6.Api.User
import Evergreen.V6.Components.Editor


type alias Model = 
    { slug : String
    , form : (Maybe Evergreen.V6.Components.Editor.Form)
    , article : (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)
    }


type Msg
    = SubmittedForm Evergreen.V6.Api.User.User Evergreen.V6.Components.Editor.Form
    | Updated Evergreen.V6.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)