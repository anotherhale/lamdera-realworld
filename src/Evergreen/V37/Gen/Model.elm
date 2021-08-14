module Evergreen.V37.Gen.Model exposing (..)

import Evergreen.V37.Gen.Params.Article.Slug_
import Evergreen.V37.Gen.Params.Editor
import Evergreen.V37.Gen.Params.Editor.ArticleSlug_
import Evergreen.V37.Gen.Params.Home_
import Evergreen.V37.Gen.Params.Login
import Evergreen.V37.Gen.Params.NotFound
import Evergreen.V37.Gen.Params.Profile.Username_
import Evergreen.V37.Gen.Params.Register
import Evergreen.V37.Gen.Params.Settings
import Evergreen.V37.Pages.Article.Slug_
import Evergreen.V37.Pages.Editor
import Evergreen.V37.Pages.Editor.ArticleSlug_
import Evergreen.V37.Pages.Home_
import Evergreen.V37.Pages.Login
import Evergreen.V37.Pages.Profile.Username_
import Evergreen.V37.Pages.Register
import Evergreen.V37.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V37.Gen.Params.Editor.Params Evergreen.V37.Pages.Editor.Model
    | Home_ Evergreen.V37.Gen.Params.Home_.Params Evergreen.V37.Pages.Home_.Model
    | Login Evergreen.V37.Gen.Params.Login.Params Evergreen.V37.Pages.Login.Model
    | NotFound Evergreen.V37.Gen.Params.NotFound.Params
    | Register Evergreen.V37.Gen.Params.Register.Params Evergreen.V37.Pages.Register.Model
    | Settings Evergreen.V37.Gen.Params.Settings.Params Evergreen.V37.Pages.Settings.Model
    | Article__Slug_ Evergreen.V37.Gen.Params.Article.Slug_.Params Evergreen.V37.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V37.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V37.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V37.Gen.Params.Profile.Username_.Params Evergreen.V37.Pages.Profile.Username_.Model
