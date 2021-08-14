module Evergreen.V8.Pages.Editor exposing (..)

import Evergreen.V8.Api.Article
import Evergreen.V8.Api.Data
import Evergreen.V8.Api.User
import Evergreen.V8.Components.Editor


type alias Model =
    { form : Evergreen.V8.Components.Editor.Form
    , article : Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V8.Api.User.User
    | Updated Evergreen.V8.Components.Editor.Field String
    | GotArticle (Evergreen.V8.Api.Data.Data Evergreen.V8.Api.Article.Article)
