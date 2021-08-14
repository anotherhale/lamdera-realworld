module Evergreen.V9.Gen.Msg exposing (..)

import Evergreen.V9.Pages.Article.Slug_
import Evergreen.V9.Pages.Editor
import Evergreen.V9.Pages.Editor.ArticleSlug_
import Evergreen.V9.Pages.Home_
import Evergreen.V9.Pages.Login
import Evergreen.V9.Pages.Profile.Username_
import Evergreen.V9.Pages.Register
import Evergreen.V9.Pages.Settings


type Msg
    = Editor Evergreen.V9.Pages.Editor.Msg
    | Home_ Evergreen.V9.Pages.Home_.Msg
    | Login Evergreen.V9.Pages.Login.Msg
    | Register Evergreen.V9.Pages.Register.Msg
    | Settings Evergreen.V9.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V9.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V9.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V9.Pages.Profile.Username_.Msg
