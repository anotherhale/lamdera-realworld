module Evergreen.V41.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V41.Api.Article
import Evergreen.V41.Api.Data
import Evergreen.V41.Api.User
import Evergreen.V41.Components.Editor


type alias Model =
    { slug : String
    , form : Maybe Evergreen.V41.Components.Editor.Form
    , article : Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V41.Api.User.User Evergreen.V41.Components.Editor.Form
    | Updated Evergreen.V41.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article)
