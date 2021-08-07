module Evergreen.V6.Gen.Model exposing (..)

import Evergreen.V6.Gen.Params.Article.Slug_
import Evergreen.V6.Gen.Params.Editor
import Evergreen.V6.Gen.Params.Editor.ArticleSlug_
import Evergreen.V6.Gen.Params.Home_
import Evergreen.V6.Gen.Params.Login
import Evergreen.V6.Gen.Params.NotFound
import Evergreen.V6.Gen.Params.Profile.Username_
import Evergreen.V6.Gen.Params.Register
import Evergreen.V6.Gen.Params.Settings
import Evergreen.V6.Pages.Article.Slug_
import Evergreen.V6.Pages.Editor
import Evergreen.V6.Pages.Editor.ArticleSlug_
import Evergreen.V6.Pages.Home_
import Evergreen.V6.Pages.Login
import Evergreen.V6.Pages.Profile.Username_
import Evergreen.V6.Pages.Register
import Evergreen.V6.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V6.Gen.Params.Editor.Params Evergreen.V6.Pages.Editor.Model
    | Home_ Evergreen.V6.Gen.Params.Home_.Params Evergreen.V6.Pages.Home_.Model
    | Login Evergreen.V6.Gen.Params.Login.Params Evergreen.V6.Pages.Login.Model
    | NotFound Evergreen.V6.Gen.Params.NotFound.Params
    | Register Evergreen.V6.Gen.Params.Register.Params Evergreen.V6.Pages.Register.Model
    | Settings Evergreen.V6.Gen.Params.Settings.Params Evergreen.V6.Pages.Settings.Model
    | Article__Slug_ Evergreen.V6.Gen.Params.Article.Slug_.Params Evergreen.V6.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V6.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V6.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V6.Gen.Params.Profile.Username_.Params Evergreen.V6.Pages.Profile.Username_.Model