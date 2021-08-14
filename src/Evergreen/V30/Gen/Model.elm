module Evergreen.V30.Gen.Model exposing (..)

import Evergreen.V30.Gen.Params.Article.Slug_
import Evergreen.V30.Gen.Params.Editor
import Evergreen.V30.Gen.Params.Editor.ArticleSlug_
import Evergreen.V30.Gen.Params.Home_
import Evergreen.V30.Gen.Params.Login
import Evergreen.V30.Gen.Params.NotFound
import Evergreen.V30.Gen.Params.Profile.Username_
import Evergreen.V30.Gen.Params.Register
import Evergreen.V30.Gen.Params.Settings
import Evergreen.V30.Pages.Article.Slug_
import Evergreen.V30.Pages.Editor
import Evergreen.V30.Pages.Editor.ArticleSlug_
import Evergreen.V30.Pages.Home_
import Evergreen.V30.Pages.Login
import Evergreen.V30.Pages.Profile.Username_
import Evergreen.V30.Pages.Register
import Evergreen.V30.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V30.Gen.Params.Editor.Params Evergreen.V30.Pages.Editor.Model
    | Home_ Evergreen.V30.Gen.Params.Home_.Params Evergreen.V30.Pages.Home_.Model
    | Login Evergreen.V30.Gen.Params.Login.Params Evergreen.V30.Pages.Login.Model
    | NotFound Evergreen.V30.Gen.Params.NotFound.Params
    | Register Evergreen.V30.Gen.Params.Register.Params Evergreen.V30.Pages.Register.Model
    | Settings Evergreen.V30.Gen.Params.Settings.Params Evergreen.V30.Pages.Settings.Model
    | Article__Slug_ Evergreen.V30.Gen.Params.Article.Slug_.Params Evergreen.V30.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V30.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V30.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V30.Gen.Params.Profile.Username_.Params Evergreen.V30.Pages.Profile.Username_.Model