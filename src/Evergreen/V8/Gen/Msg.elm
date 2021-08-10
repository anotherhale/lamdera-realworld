module Evergreen.V8.Gen.Msg exposing (..)

import Evergreen.V8.Pages.Article.Slug_
import Evergreen.V8.Pages.Editor
import Evergreen.V8.Pages.Editor.ArticleSlug_
import Evergreen.V8.Pages.Home_
import Evergreen.V8.Pages.Login
import Evergreen.V8.Pages.Profile.Username_
import Evergreen.V8.Pages.Register
import Evergreen.V8.Pages.Settings


type Msg
    = Editor Evergreen.V8.Pages.Editor.Msg
    | Home_ Evergreen.V8.Pages.Home_.Msg
    | Login Evergreen.V8.Pages.Login.Msg
    | Register Evergreen.V8.Pages.Register.Msg
    | Settings Evergreen.V8.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V8.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V8.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V8.Pages.Profile.Username_.Msg