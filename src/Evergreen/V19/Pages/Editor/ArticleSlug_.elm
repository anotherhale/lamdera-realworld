module Evergreen.V19.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V19.Api.Article
import Evergreen.V19.Api.Data
import Evergreen.V19.Api.User
import Evergreen.V19.Components.Editor


type alias Model =
    { slug : String
    , form : Maybe Evergreen.V19.Components.Editor.Form
    , article : Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V19.Api.User.User Evergreen.V19.Components.Editor.Form
    | Updated Evergreen.V19.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article)
