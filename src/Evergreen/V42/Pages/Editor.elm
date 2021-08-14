module Evergreen.V42.Pages.Editor exposing (..)

import Evergreen.V42.Api.Article
import Evergreen.V42.Api.Data
import Evergreen.V42.Api.User
import Evergreen.V42.Components.Editor


type alias Model =
    { form : Evergreen.V42.Components.Editor.Form
    , article : Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article
    }


type Msg
    = SubmittedForm Evergreen.V42.Api.User.User
    | Updated Evergreen.V42.Components.Editor.Field String
    | GotArticle (Evergreen.V42.Api.Data.Data Evergreen.V42.Api.Article.Article)
