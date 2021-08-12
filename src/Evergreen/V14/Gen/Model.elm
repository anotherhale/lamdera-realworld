module Evergreen.V14.Gen.Model exposing (..)

import Evergreen.V14.Gen.Params.Article.Slug_
import Evergreen.V14.Gen.Params.Editor
import Evergreen.V14.Gen.Params.Editor.ArticleSlug_
import Evergreen.V14.Gen.Params.Home_
import Evergreen.V14.Gen.Params.Login
import Evergreen.V14.Gen.Params.NotFound
import Evergreen.V14.Gen.Params.Profile.Username_
import Evergreen.V14.Gen.Params.Register
import Evergreen.V14.Gen.Params.Settings
import Evergreen.V14.Pages.Article.Slug_
import Evergreen.V14.Pages.Editor
import Evergreen.V14.Pages.Editor.ArticleSlug_
import Evergreen.V14.Pages.Home_
import Evergreen.V14.Pages.Login
import Evergreen.V14.Pages.Profile.Username_
import Evergreen.V14.Pages.Register
import Evergreen.V14.Pages.Settings


type Model
    = Redirecting_
    | Editor Evergreen.V14.Gen.Params.Editor.Params Evergreen.V14.Pages.Editor.Model
    | Home_ Evergreen.V14.Gen.Params.Home_.Params Evergreen.V14.Pages.Home_.Model
    | Login Evergreen.V14.Gen.Params.Login.Params Evergreen.V14.Pages.Login.Model
    | NotFound Evergreen.V14.Gen.Params.NotFound.Params
    | Register Evergreen.V14.Gen.Params.Register.Params Evergreen.V14.Pages.Register.Model
    | Settings Evergreen.V14.Gen.Params.Settings.Params Evergreen.V14.Pages.Settings.Model
    | Article__Slug_ Evergreen.V14.Gen.Params.Article.Slug_.Params Evergreen.V14.Pages.Article.Slug_.Model
    | Editor__ArticleSlug_ Evergreen.V14.Gen.Params.Editor.ArticleSlug_.Params Evergreen.V14.Pages.Editor.ArticleSlug_.Model
    | Profile__Username_ Evergreen.V14.Gen.Params.Profile.Username_.Params Evergreen.V14.Pages.Profile.Username_.Model