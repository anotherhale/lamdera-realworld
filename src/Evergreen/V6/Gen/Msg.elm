module Evergreen.V6.Gen.Msg exposing (..)

import Evergreen.V6.Pages.Article.Slug_
import Evergreen.V6.Pages.Editor
import Evergreen.V6.Pages.Editor.ArticleSlug_
import Evergreen.V6.Pages.Home_
import Evergreen.V6.Pages.Login
import Evergreen.V6.Pages.Profile.Username_
import Evergreen.V6.Pages.Register
import Evergreen.V6.Pages.Settings


type Msg
    = Editor Evergreen.V6.Pages.Editor.Msg
    | Home_ Evergreen.V6.Pages.Home_.Msg
    | Login Evergreen.V6.Pages.Login.Msg
    | Register Evergreen.V6.Pages.Register.Msg
    | Settings Evergreen.V6.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V6.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V6.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V6.Pages.Profile.Username_.Msg