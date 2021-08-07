module Evergreen.V6.Types exposing (..)

import Browser
import Browser.Navigation
import Dict
import Evergreen.V6.Api.Article
import Evergreen.V6.Api.Article.Comment
import Evergreen.V6.Api.User
import Evergreen.V6.Bridge
import Evergreen.V6.Gen.Pages
import Evergreen.V6.Shared
import Lamdera
import Time
import Url


type alias FrontendModel =
    { url : Url.Url
    , key : Browser.Navigation.Key
    , shared : Evergreen.V6.Shared.Model
    , page : Evergreen.V6.Gen.Pages.Model
    }


type alias Session = 
    { userId : Int
    , expires : Time.Posix
    }


type alias BackendModel =
    { sessions : (Dict.Dict Lamdera.SessionId Session)
    , users : (Dict.Dict Int Evergreen.V6.Api.User.UserFull)
    , articles : (Dict.Dict Evergreen.V6.Api.Article.Slug Evergreen.V6.Api.Article.ArticleStore)
    , comments : (Dict.Dict Evergreen.V6.Api.Article.Slug (Dict.Dict Int Evergreen.V6.Api.Article.Comment.Comment))
    }


type FrontendMsg
    = ChangedUrl Url.Url
    | ClickedLink Browser.UrlRequest
    | Shared Evergreen.V6.Shared.Msg
    | Page Evergreen.V6.Gen.Pages.Msg
    | Noop


type alias ToBackend =Evergreen.V6.Bridge.ToBackend


type BackendMsg
    = CheckSession Lamdera.SessionId Lamdera.ClientId
    | RenewSession Evergreen.V6.Api.User.UserId Lamdera.SessionId Lamdera.ClientId Time.Posix
    | ArticleCreated Time.Posix (Maybe Evergreen.V6.Api.User.UserFull) Lamdera.ClientId 
    { title : String
    , description : String
    , body : String
    , tags : (List String)
    }
    | ArticleCommentCreated Time.Posix (Maybe Evergreen.V6.Api.User.UserFull) Lamdera.ClientId Evergreen.V6.Api.Article.Slug 
    { body : String
    }
    | NoOpBackendMsg


type ToFrontend
    = ActiveSession Evergreen.V6.Api.User.User
    | PageMsg Evergreen.V6.Gen.Pages.Msg
    | NoOpToFrontend