module Evergreen.V37.Gen.Msg exposing (..)

import Evergreen.V37.Pages.Article.Slug_
import Evergreen.V37.Pages.Editor
import Evergreen.V37.Pages.Editor.ArticleSlug_
import Evergreen.V37.Pages.Home_
import Evergreen.V37.Pages.Login
import Evergreen.V37.Pages.Profile.Username_
import Evergreen.V37.Pages.Register
import Evergreen.V37.Pages.Settings


type Msg
    = Editor Evergreen.V37.Pages.Editor.Msg
    | Home_ Evergreen.V37.Pages.Home_.Msg
    | Login Evergreen.V37.Pages.Login.Msg
    | Register Evergreen.V37.Pages.Register.Msg
    | Settings Evergreen.V37.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V37.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V37.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V37.Pages.Profile.Username_.Msg
