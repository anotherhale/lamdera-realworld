module Evergreen.V19.Pages.Editor exposing (..)

import Evergreen.V19.Api.Article
import Evergreen.V19.Api.Data
import Evergreen.V19.Api.User
import Evergreen.V19.Components.Editor


type alias Model =
    { form : Evergreen.V19.Components.Editor.Form
    , article : Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V19.Api.User.User
    | Updated Evergreen.V19.Components.Editor.Field String
    | GotArticle (Evergreen.V19.Api.Data.Data Evergreen.V19.Api.Article.Article)
