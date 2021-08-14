module Evergreen.V14.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V14.Api.Article
import Evergreen.V14.Api.Data
import Evergreen.V14.Api.User
import Evergreen.V14.Components.Editor


type alias Model =
    { slug : String
    , form : Maybe Evergreen.V14.Components.Editor.Form
    , article : Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V14.Api.User.User Evergreen.V14.Components.Editor.Form
    | Updated Evergreen.V14.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article)
