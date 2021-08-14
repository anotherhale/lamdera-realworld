module Evergreen.V13.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V13.Api.Article
import Evergreen.V13.Api.Data
import Evergreen.V13.Api.User
import Evergreen.V13.Components.Editor


type alias Model =
    { slug : String
    , form : Maybe Evergreen.V13.Components.Editor.Form
    , article : Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V13.Api.User.User Evergreen.V13.Components.Editor.Form
    | Updated Evergreen.V13.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article)
