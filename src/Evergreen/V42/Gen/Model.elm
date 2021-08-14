module Evergreen.V42.Gen.Model exposing (..)

import Evergreen.V42.Gen.Params.Article.Slug_
import Evergreen.V42.Gen.Params.Editor
import Evergreen.V42.Gen.Params.Editor.ArticleSlug_
import Evergreen.V42.Gen.Params.Home_
import Evergreen.V42.Gen.Params.Login
import Evergreen.V42.Gen.Params.NotFound
import Evergreen.V42.Gen.Params.Profile.Username_
import Evergreen.V42.Gen.Params.Register
import Evergreen.V42.Gen.Params.Settings
import Evergreen.V42.Pages.Article.Slug_
import Evergreen.V42.Pages.Editor
import Evergreen.V42.Pages.Editor.ArticleSlug_
import Evergreen.V42.Pages.Home_
import Evergreen.V42.Pages.Login
import Evergreen.V42.Pages.Profile.Username_
import Evergreen.V42.Pages.Register
import Evergreen.V42.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V42.Gen.Params.Editor.Params Evergreen.V42.Pages.Editor.Model
    | Home_ Evergreen.V42.Gen.Params.Home_.Params Evergreen.V42.Pages.Home_.Model
    | Login Evergreen.V42.Gen.Params.Login.Params Evergreen.V42.Pages.Login.Model
    | NotFound Evergreen.V42.Gen.Params.NotFound.Params
    | Register Evergreen.V42.Gen.Params.Register.Params Evergreen.V42.Pages.Register.Model
    | Settings Evergreen.V42.Gen.Params.Settings.Params Evergreen.V42.Pages.Settings.Model
    | Article__Slug_ Evergreen.V42.Gen.Params.Article.Slug_.Params Evergreen.V42.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V42.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V42.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V42.Gen.Params.Profile.Username_.Params Evergreen.V42.Pages.Profile.Username_.Model
