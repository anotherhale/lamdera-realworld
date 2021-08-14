module Evergreen.V14.Gen.Msg exposing (..)

import Evergreen.V14.Pages.Article.Slug_
import Evergreen.V14.Pages.Editor
import Evergreen.V14.Pages.Editor.ArticleSlug_
import Evergreen.V14.Pages.Home_
import Evergreen.V14.Pages.Login
import Evergreen.V14.Pages.Profile.Username_
import Evergreen.V14.Pages.Register
import Evergreen.V14.Pages.Settings


type Msg
    = Editor Evergreen.V14.Pages.Editor.Msg
    | Home_ Evergreen.V14.Pages.Home_.Msg
    | Login Evergreen.V14.Pages.Login.Msg
    | Register Evergreen.V14.Pages.Register.Msg
    | Settings Evergreen.V14.Pages.Settings.Msg
    | Article__Slug_ Evergreen.V14.Pages.Article.Slug_.Msg
    | Editor__ArticleSlug_ Evergreen.V14.Pages.Editor.ArticleSlug_.Msg
    | Profile__Username_ Evergreen.V14.Pages.Profile.Username_.Msg
