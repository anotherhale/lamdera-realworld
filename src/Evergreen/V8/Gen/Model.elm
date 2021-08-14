module Evergreen.V8.Gen.Model exposing (..)

import Evergreen.V8.Gen.Params.Article.Slug_
import Evergreen.V8.Gen.Params.Editor
import Evergreen.V8.Gen.Params.Editor.ArticleSlug_
import Evergreen.V8.Gen.Params.Home_
import Evergreen.V8.Gen.Params.Login
import Evergreen.V8.Gen.Params.NotFound
import Evergreen.V8.Gen.Params.Profile.Username_
import Evergreen.V8.Gen.Params.Register
import Evergreen.V8.Gen.Params.Settings
import Evergreen.V8.Pages.Article.Slug_
import Evergreen.V8.Pages.Editor
import Evergreen.V8.Pages.Editor.ArticleSlug_
import Evergreen.V8.Pages.Home_
import Evergreen.V8.Pages.Login
import Evergreen.V8.Pages.Profile.Username_
import Evergreen.V8.Pages.Register
import Evergreen.V8.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V8.Gen.Params.Editor.Params Evergreen.V8.Pages.Editor.Model
    | Home_ Evergreen.V8.Gen.Params.Home_.Params Evergreen.V8.Pages.Home_.Model
    | Login Evergreen.V8.Gen.Params.Login.Params Evergreen.V8.Pages.Login.Model
    | NotFound Evergreen.V8.Gen.Params.NotFound.Params
    | Register Evergreen.V8.Gen.Params.Register.Params Evergreen.V8.Pages.Register.Model
    | Settings Evergreen.V8.Gen.Params.Settings.Params Evergreen.V8.Pages.Settings.Model
    | Article__Slug_ Evergreen.V8.Gen.Params.Article.Slug_.Params Evergreen.V8.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V8.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V8.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V8.Gen.Params.Profile.Username_.Params Evergreen.V8.Pages.Profile.Username_.Model
