module Evergreen.V1.Api.Data exposing (..)

type Data value
    = NotAsked
    | Loading
    | Failure (List String)
    | Success value