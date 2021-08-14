module Evergreen.V41.Gen.Model exposing (..)

import Evergreen.V41.Gen.Params.Article.Slug_
import Evergreen.V41.Gen.Params.Editor
import Evergreen.V41.Gen.Params.Editor.ArticleSlug_
import Evergreen.V41.Gen.Params.Home_
import Evergreen.V41.Gen.Params.Login
import Evergreen.V41.Gen.Params.NotFound
import Evergreen.V41.Gen.Params.Profile.Username_
import Evergreen.V41.Gen.Params.Register
import Evergreen.V41.Gen.Params.Settings
import Evergreen.V41.Pages.Article.Slug_
import Evergreen.V41.Pages.Editor
import Evergreen.V41.Pages.Editor.ArticleSlug_
import Evergreen.V41.Pages.Home_
import Evergreen.V41.Pages.Login
import Evergreen.V41.Pages.Profile.Username_
import Evergreen.V41.Pages.Register
import Evergreen.V41.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V41.Gen.Params.Editor.Params Evergreen.V41.Pages.Editor.Model
    | Home_ Evergreen.V41.Gen.Params.Home_.Params Evergreen.V41.Pages.Home_.Model
    | Login Evergreen.V41.Gen.Params.Login.Params Evergreen.V41.Pages.Login.Model
    | NotFound Evergreen.V41.Gen.Params.NotFound.Params
    | Register Evergreen.V41.Gen.Params.Register.Params Evergreen.V41.Pages.Register.Model
    | Settings Evergreen.V41.Gen.Params.Settings.Params Evergreen.V41.Pages.Settings.Model
    | Article__Slug_ Evergreen.V41.Gen.Params.Article.Slug_.Params Evergreen.V41.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V41.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V41.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V41.Gen.Params.Profile.Username_.Params Evergreen.V41.Pages.Profile.Username_.Model
