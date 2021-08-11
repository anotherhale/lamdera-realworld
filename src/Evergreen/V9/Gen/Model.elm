module Evergreen.V9.Gen.Model exposing (..)

import Evergreen.V9.Gen.Params.Article.Slug_
import Evergreen.V9.Gen.Params.Editor
import Evergreen.V9.Gen.Params.Editor.ArticleSlug_
import Evergreen.V9.Gen.Params.Home_
import Evergreen.V9.Gen.Params.Login
import Evergreen.V9.Gen.Params.NotFound
import Evergreen.V9.Gen.Params.Profile.Username_
import Evergreen.V9.Gen.Params.Register
import Evergreen.V9.Gen.Params.Settings
import Evergreen.V9.Pages.Article.Slug_
import Evergreen.V9.Pages.Editor
import Evergreen.V9.Pages.Editor.ArticleSlug_
import Evergreen.V9.Pages.Home_
import Evergreen.V9.Pages.Login
import Evergreen.V9.Pages.Profile.Username_
import Evergreen.V9.Pages.Register
import Evergreen.V9.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V9.Gen.Params.Editor.Params Evergreen.V9.Pages.Editor.Model
    | Home_ Evergreen.V9.Gen.Params.Home_.Params Evergreen.V9.Pages.Home_.Model
    | Login Evergreen.V9.Gen.Params.Login.Params Evergreen.V9.Pages.Login.Model
    | NotFound Evergreen.V9.Gen.Params.NotFound.Params
    | Register Evergreen.V9.Gen.Params.Register.Params Evergreen.V9.Pages.Register.Model
    | Settings Evergreen.V9.Gen.Params.Settings.Params Evergreen.V9.Pages.Settings.Model
    | Article__Slug_ Evergreen.V9.Gen.Params.Article.Slug_.Params Evergreen.V9.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V9.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V9.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V9.Gen.Params.Profile.Username_.Params Evergreen.V9.Pages.Profile.Username_.Model