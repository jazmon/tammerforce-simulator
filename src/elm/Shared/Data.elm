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

coderNames : List Coder
coderNames =
  [ (Coder 0 0 "Hessu Kypärä" "miro")
  , (Coder 0 0 "Ahto Simakuutio" "op")
  , (Coder 0 0 "Markku Markkula" "ippe")
  , (Coder 0 0 "Jorma Teräs" "eetu")
  ]

getCoderByIndex : Int -> Coder
getCoderByIndex idx = Array.fromList coderNames |> Array.get idx  |> \prospect ->
  case prospect of
    Nothing ->
      (Coder 0 0 "Fallback Coder" "miro")

    Just val ->
      val
