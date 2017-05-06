module Shared.Data exposing (..)

import Array
import Random exposing (Generator)

import Shared.Types exposing (..)
import App.Types exposing (..)


randomInteger : Int -> Generator Int
randomInteger maxInt = Random.int 0 maxInt

getRoundRandomFactor : Cmd Msg
getRoundRandomFactor = Random.generate
  (\ generatedRandomFactor -> ExecuteRound { randomFactor = generatedRandomFactor })
  (randomInteger 100
  )


getRandomCoderIndex :  Cmd Msg
getRandomCoderIndex = Random.generate
  (\ generatedRandomIndex -> AddCoder { coderIndex = generatedRandomIndex })
  (randomInteger (List.length coderNames)
  )

coderNames : List Coder
coderNames =
  [ (Coder 3 20 "Hessu Kypärä" "miro")
  , (Coder 2 10 "Ahto Simakuutio" "op")
  , (Coder 4 30 "Markku Markkula" "ippe")
  , (Coder 5 10 "Jorma Teräs" "eetu")
  ]


eventStash : List Event
eventStash =
  [ (Event "Coffee machine exploded" [
    (Option "Buy a new one!" "Not surprisignly people are happy. Coffee keeps this shitshow going!" -5 -5 0)
    , (Option "Drink water" "What is this shit. How can you deliver without black gold?" 0 10 0)
    ])
  ]


getCoderByIndex : Int -> Coder
getCoderByIndex idx = Array.fromList coderNames |> Array.get idx  |> \prospect ->
  case prospect of
    Nothing ->
      (Coder 1 1 "Fallback Coder" "miro")

    Just val ->
      val
