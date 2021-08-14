module Evergreen.V19.Gen.Msg exposing (..)

import Evergreen.V19.Pages.Article.Slug_
import Evergreen.V19.Pages.Editor
import Evergreen.V19.Pages.Editor.ArticleSlug_
import Evergreen.V19.Pages.Home_
import Evergreen.V19.Pages.Login
import Evergreen.V19.Pages.Profile.Username_
import Evergreen.V19.Pages.Register
import Evergreen.V19.Pages.Settings


type Msg
    = Editor Evergreen.V19.Pages.Editor.Msg
    | Home_ Evergreen.V19.Pages.Home_.Msg
    | Login Evergreen.V19.Pages.Login.Msg
    | Register Evergreen.V19.Pages.Register.Msg
    | Settings Evergreen.V19.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V19.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V19.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V19.Pages.Profile.Username_.Msg
