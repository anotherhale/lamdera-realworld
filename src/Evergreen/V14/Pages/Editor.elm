module Evergreen.V14.Pages.Editor exposing (..)

import Evergreen.V14.Api.Article
import Evergreen.V14.Api.Data
import Evergreen.V14.Api.User
import Evergreen.V14.Components.Editor


type alias Model =
    { form : Evergreen.V14.Components.Editor.Form
    , article : Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V14.Api.User.User
    | Updated Evergreen.V14.Components.Editor.Field String
    | GotArticle (Evergreen.V14.Api.Data.Data Evergreen.V14.Api.Article.Article)
