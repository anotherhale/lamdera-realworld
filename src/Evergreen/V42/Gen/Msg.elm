module Evergreen.V42.Gen.Msg exposing (..)

import Evergreen.V42.Pages.Article.Slug_
import Evergreen.V42.Pages.Editor
import Evergreen.V42.Pages.Editor.ArticleSlug_
import Evergreen.V42.Pages.Home_
import Evergreen.V42.Pages.Login
import Evergreen.V42.Pages.Profile.Username_
import Evergreen.V42.Pages.Register
import Evergreen.V42.Pages.Settings


type Msg
    = Editor Evergreen.V42.Pages.Editor.Msg
    | Home_ Evergreen.V42.Pages.Home_.Msg
    | Login Evergreen.V42.Pages.Login.Msg
    | Register Evergreen.V42.Pages.Register.Msg
    | Settings Evergreen.V42.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V42.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V42.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V42.Pages.Profile.Username_.Msg
