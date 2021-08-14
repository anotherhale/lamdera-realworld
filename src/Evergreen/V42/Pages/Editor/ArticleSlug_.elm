module Evergreen.V42.Pages.Editor.ArticleSlug_ exposing (..)

import Evergreen.V42.Api.Article
import Evergreen.V42.Api.Data
import Evergreen.V42.Api.User
import Evergreen.V42.Components.Editor


type alias Model =
    { slug : String
    , form : Maybe Evergreen.V42.Components.Editor.Form
    , article : Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V42.Api.User.User Evergreen.V42.Components.Editor.Form
    | Updated Evergreen.V42.Components.Editor.Field String
    | UpdatedArticle (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article)
    | LoadedInitialArticle (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article)
