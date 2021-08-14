module Evergreen.V8.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V8.Api.Article
import Evergreen.V8.Api.Data
import Evergreen.V8.Api.User
import Evergreen.V8.Components.Editor


type alias Model =
    { slug : String
    , form : Maybe Evergreen.V8.Components.Editor.Form
    , article : Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V8.Api.User.User Evergreen.V8.Components.Editor.Form
    | Updated Evergreen.V8.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article)
