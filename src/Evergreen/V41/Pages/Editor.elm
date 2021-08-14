module Evergreen.V41.Pages.Editor exposing (..)

import Evergreen.V41.Api.Article
import Evergreen.V41.Api.Data
import Evergreen.V41.Api.User
import Evergreen.V41.Components.Editor


type alias Model =
    { form : Evergreen.V41.Components.Editor.Form
    , article : Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V41.Api.User.User
    | Updated Evergreen.V41.Components.Editor.Field String
    | GotArticle (Evergreen.V41.Api.Data.Data Evergreen.V41.Api.Article.Article)
