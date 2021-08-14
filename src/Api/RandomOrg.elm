module Api.RandomOrg exposing (..)

import Http
import Prng.Uuid as Uuid
import Random.Pcg.Extended as Random



{- Usage:


   type Msg
     = RandomSeedResult (Result Http.Error String)
     | ...


   cmd = RandomOrg.get5Random32Bit RandomSeedResult


   update msg model =
     RandomSeedResult result ->
         ( { model
             | uuid =
                 RandomOrg.toMaybeUuid result
           }
         , Cmd.none
         )

     ...


   Idea courtesy of @jxxcarlson on elm-lang.slack.com

-}


toMaybeUuid : Result Http.Error String -> Maybe String
toMaybeUuid result =
    let
        newUuid =
            case parsed of
                seed :: seedExtension ->
                    Random.initialSeed seed seedExtension
                        |> Random.step Uuid.generator
                        |> Tuple.first
                        |> Uuid.toString
                        |> Just

                _ ->
                    Nothing

        parsed =
            case result of
                Ok s ->
                    s
                        |> String.split "\n"
                        |> List.map String.toInt
                        |> justs

                Err _ ->
                    []
    in
    newUuid


urlGet5Random32Bit : String
urlGet5Random32Bit =
    "https://www.random.org/integers/?num=5&min=-1000000000&max=1000000000&col=1&base=10&format=plain&rnd=new"


get5Random32Bit : (Result Http.Error String -> msg) -> Cmd msg
get5Random32Bit msg =
    Http.get { expect = Http.expectString msg, url = urlGet5Random32Bit }


justs =
    List.foldl
        (\v acc ->
            case v of
                Just el ->
                    acc ++ [ el ]

                Nothing ->
                    acc
        )
        []
