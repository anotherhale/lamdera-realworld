module Evergreen.V30.Pages.Editor exposing (..)

import Evergreen.V30.Api.Article
import Evergreen.V30.Api.Data
import Evergreen.V30.Api.User
import Evergreen.V30.Components.Editor


type alias Model = 
    { form : Evergreen.V30.Components.Editor.Form
    , article : (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)
    }


type Msg
    = SubmittedForm Evergreen.V30.Api.User.User
    | Updated Evergreen.V30.Components.Editor.Field String
    | GotArticle (Evergreen.V30.Api.Data.Data Evergreen.V30.Api.Article.Article)