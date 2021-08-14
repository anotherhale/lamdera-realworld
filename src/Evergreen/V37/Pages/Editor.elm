module Evergreen.V37.Pages.Editor exposing (..)

import Evergreen.V37.Api.Article
import Evergreen.V37.Api.Data
import Evergreen.V37.Api.User
import Evergreen.V37.Components.Editor


type alias Model =
    { form : Evergreen.V37.Components.Editor.Form
    , article : Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V37.Api.User.User
    | Updated Evergreen.V37.Components.Editor.Field String
    | GotArticle (Evergreen.V37.Api.Data.Data Evergreen.V37.Api.Article.Article)
