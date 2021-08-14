module Evergreen.V37.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V37.Api.Article
import Evergreen.V37.Api.Data
import Evergreen.V37.Api.User
import Evergreen.V37.Components.Editor


type alias Model =
    { slug : String
    , form : Maybe Evergreen.V37.Components.Editor.Form
    , article : Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V37.Api.User.User Evergreen.V37.Components.Editor.Form
    | Updated Evergreen.V37.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article)
