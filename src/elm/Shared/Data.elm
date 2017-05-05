module Shared.Data exposing (..)

import Array
import Random exposing (Generator)

import Shared.Types exposing (..)
import App.Types exposing (..)


randomMember : Int -> Generator Int
randomMember maxInt = Random.int 0 maxInt

getRandomCoderIndex : CoderCreationTriggeringPayload -> Cmd Msg
getRandomCoderIndex payload = Random.generate
  (\ generatedRandomIndex -> AddCoder { coderIndex = generatedRandomIndex })
  (randomMember (List.length coderNames)
  )

coderNames : List Coder
coderNames =
  [ (Coder 3 20 "Hessu Kypärä" "miro")
  , (Coder 2 10 "Ahto Simakuutio" "op")
  , (Coder 4 30 "Markku Markkula" "ippe")
  , (Coder 5 10 "Jorma Teräs" "eetu")
  ]


getCoderByIndex : Int -> Coder
getCoderByIndex idx = Array.fromList coderNames |> Array.get idx  |> \prospect ->
  case prospect of
    Nothing ->
      (Coder 1 1 "Fallback Coder" "miro")

    Just val ->
      val
