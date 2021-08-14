module Evergreen.V13.Pages.Editor exposing (..)

import Evergreen.V13.Api.Article
import Evergreen.V13.Api.Data
import Evergreen.V13.Api.User
import Evergreen.V13.Components.Editor


type alias Model =
    { form : Evergreen.V13.Components.Editor.Form
    , article : Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V13.Api.User.User
    | Updated Evergreen.V13.Components.Editor.Field String
    | GotArticle (Evergreen.V13.Api.Data.Data Evergreen.V13.Api.Article.Article)
