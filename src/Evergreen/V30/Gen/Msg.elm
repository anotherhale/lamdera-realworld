module Evergreen.V30.Gen.Msg exposing (..)

import Evergreen.V30.Pages.Article.Slug_
import Evergreen.V30.Pages.Editor
import Evergreen.V30.Pages.Editor.ArticleSlug_
import Evergreen.V30.Pages.Home_
import Evergreen.V30.Pages.Login
import Evergreen.V30.Pages.Profile.Username_
import Evergreen.V30.Pages.Register
import Evergreen.V30.Pages.Settings


type Msg
    = Editor Evergreen.V30.Pages.Editor.Msg
    | Home_ Evergreen.V30.Pages.Home_.Msg
    | Login Evergreen.V30.Pages.Login.Msg
    | Register Evergreen.V30.Pages.Register.Msg
    | Settings Evergreen.V30.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V30.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V30.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V30.Pages.Profile.Username_.Msg