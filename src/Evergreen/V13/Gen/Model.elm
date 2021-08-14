module Evergreen.V13.Gen.Model exposing (..)

import Evergreen.V13.Gen.Params.Article.Slug_
import Evergreen.V13.Gen.Params.Editor
import Evergreen.V13.Gen.Params.Editor.ArticleSlug_
import Evergreen.V13.Gen.Params.Home_
import Evergreen.V13.Gen.Params.Login
import Evergreen.V13.Gen.Params.NotFound
import Evergreen.V13.Gen.Params.Profile.Username_
import Evergreen.V13.Gen.Params.Register
import Evergreen.V13.Gen.Params.Settings
import Evergreen.V13.Pages.Article.Slug_
import Evergreen.V13.Pages.Editor
import Evergreen.V13.Pages.Editor.ArticleSlug_
import Evergreen.V13.Pages.Home_
import Evergreen.V13.Pages.Login
import Evergreen.V13.Pages.Profile.Username_
import Evergreen.V13.Pages.Register
import Evergreen.V13.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V13.Gen.Params.Editor.Params Evergreen.V13.Pages.Editor.Model
    | Home_ Evergreen.V13.Gen.Params.Home_.Params Evergreen.V13.Pages.Home_.Model
    | Login Evergreen.V13.Gen.Params.Login.Params Evergreen.V13.Pages.Login.Model
    | NotFound Evergreen.V13.Gen.Params.NotFound.Params
    | Register Evergreen.V13.Gen.Params.Register.Params Evergreen.V13.Pages.Register.Model
    | Settings Evergreen.V13.Gen.Params.Settings.Params Evergreen.V13.Pages.Settings.Model
    | Article__Slug_ Evergreen.V13.Gen.Params.Article.Slug_.Params Evergreen.V13.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V13.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V13.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V13.Gen.Params.Profile.Username_.Params Evergreen.V13.Pages.Profile.Username_.Model
