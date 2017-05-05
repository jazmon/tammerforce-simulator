module Shared.Data exposing (..)

import Array
import Random exposing (Generator)

import Shared.Types exposing (..)
import App.Types exposing (..)


randomMember : Int -> Generator Int
randomMember maxInt = Random.int 0 maxInt

getRandomCoderIndex : CoderCreationTriggeringPayload -> Cmd Msg
getRandomCoderIndex payload = Random.generate
  (\ generatedRandomIndex -> AddCoder { ebitRate = payload.ebitRate, cost = payload.cost, coderIndex = generatedRandomIndex })
  (randomMember (List.length coderNames)
  )



coderNames : List String
coderNames = [
  "Hessu Kypärä"
  , "Ahto Simakuutio"
  , "Markku Markkula"
  , "Jorma Teräs"
  ]

getCoderByIndex : Int -> String
getCoderByIndex idx = Array.fromList coderNames |> Array.get idx  |> \prospect ->
  case prospect of
    Nothing ->
      "Fallback Coder"

    Just val ->
      val
