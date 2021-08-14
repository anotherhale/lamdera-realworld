module Evergreen.V41.Gen.Msg exposing (..)

import Evergreen.V41.Pages.Article.Slug_
import Evergreen.V41.Pages.Editor
import Evergreen.V41.Pages.Editor.ArticleSlug_
import Evergreen.V41.Pages.Home_
import Evergreen.V41.Pages.Login
import Evergreen.V41.Pages.Profile.Username_
import Evergreen.V41.Pages.Register
import Evergreen.V41.Pages.Settings


type Msg
    = Editor Evergreen.V41.Pages.Editor.Msg
    | Home_ Evergreen.V41.Pages.Home_.Msg
    | Login Evergreen.V41.Pages.Login.Msg
    | Register Evergreen.V41.Pages.Register.Msg
    | Settings Evergreen.V41.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V41.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V41.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V41.Pages.Profile.Username_.Msg
