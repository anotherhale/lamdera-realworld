module Evergreen.V41.Components.Editor exposing (..)


type alias Form =
    { title : String
    , description : String
    , body : String
    , tags : String
    }


type Field
    = Title
    | Description
    | Body
    | Tags
