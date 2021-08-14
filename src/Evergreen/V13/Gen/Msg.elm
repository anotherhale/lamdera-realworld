module Evergreen.V13.Gen.Msg exposing (..)

import Evergreen.V13.Pages.Article.Slug_
import Evergreen.V13.Pages.Editor
import Evergreen.V13.Pages.Editor.ArticleSlug_
import Evergreen.V13.Pages.Home_
import Evergreen.V13.Pages.Login
import Evergreen.V13.Pages.Profile.Username_
import Evergreen.V13.Pages.Register
import Evergreen.V13.Pages.Settings


type Msg
    = Editor Evergreen.V13.Pages.Editor.Msg
    | Home_ Evergreen.V13.Pages.Home_.Msg
    | Login Evergreen.V13.Pages.Login.Msg
    | Register Evergreen.V13.Pages.Register.Msg
    | Settings Evergreen.V13.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V13.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V13.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V13.Pages.Profile.Username_.Msg
