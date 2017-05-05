module App.Types exposing (..)

import Shared.Types exposing (Customer, Coder)


type Msg
    = NoOp
    | GenerateEbit Int
    | AddCoder Coder


type alias Model =
    { ebit : Int
    , ebitRate : Int
    , coders : List Coder
    }
