module Evergreen.V9.Pages.Editor exposing (..)

import Evergreen.V9.Api.Article
import Evergreen.V9.Api.Data
import Evergreen.V9.Api.User
import Evergreen.V9.Components.Editor


type alias Model = 
    { form : Evergreen.V9.Components.Editor.Form
    , article : (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article)
    }


type Msg
    = SubmittedForm Evergreen.V9.Api.User.User
    | Updated Evergreen.V9.Components.Editor.Field String
    | GotArticle (Evergreen.V9.Api.Data.Data Evergreen.V9.Api.Article.Article)