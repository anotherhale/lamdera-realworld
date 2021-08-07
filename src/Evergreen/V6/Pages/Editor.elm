module Evergreen.V6.Pages.Editor exposing (..)

import Evergreen.V6.Api.Article
import Evergreen.V6.Api.Data
import Evergreen.V6.Api.User
import Evergreen.V6.Components.Editor


type alias Model = 
    { form : Evergreen.V6.Components.Editor.Form
    , article : (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)
    }


type Msg
    = SubmittedForm Evergreen.V6.Api.User.User
    | Updated Evergreen.V6.Components.Editor.Field String
    | GotArticle (Evergreen.V6.Api.Data.Data Evergreen.V6.Api.Article.Article)