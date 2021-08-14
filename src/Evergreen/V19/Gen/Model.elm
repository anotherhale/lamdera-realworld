module Evergreen.V19.Gen.Model exposing (..)

import Evergreen.V19.Gen.Params.Article.Slug_
import Evergreen.V19.Gen.Params.Editor
import Evergreen.V19.Gen.Params.Editor.ArticleSlug_
import Evergreen.V19.Gen.Params.Home_
import Evergreen.V19.Gen.Params.Login
import Evergreen.V19.Gen.Params.NotFound
import Evergreen.V19.Gen.Params.Profile.Username_
import Evergreen.V19.Gen.Params.Register
import Evergreen.V19.Gen.Params.Settings
import Evergreen.V19.Pages.Article.Slug_
import Evergreen.V19.Pages.Editor
import Evergreen.V19.Pages.Editor.ArticleSlug_
import Evergreen.V19.Pages.Home_
import Evergreen.V19.Pages.Login
import Evergreen.V19.Pages.Profile.Username_
import Evergreen.V19.Pages.Register
import Evergreen.V19.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V19.Gen.Params.Editor.Params Evergreen.V19.Pages.Editor.Model
    | Home_ Evergreen.V19.Gen.Params.Home_.Params Evergreen.V19.Pages.Home_.Model
    | Login Evergreen.V19.Gen.Params.Login.Params Evergreen.V19.Pages.Login.Model
    | NotFound Evergreen.V19.Gen.Params.NotFound.Params
    | Register Evergreen.V19.Gen.Params.Register.Params Evergreen.V19.Pages.Register.Model
    | Settings Evergreen.V19.Gen.Params.Settings.Params Evergreen.V19.Pages.Settings.Model
    | Article__Slug_ Evergreen.V19.Gen.Params.Article.Slug_.Params Evergreen.V19.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V19.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V19.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V19.Gen.Params.Profile.Username_.Params Evergreen.V19.Pages.Profile.Username_.Model