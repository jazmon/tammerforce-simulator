module App.Types exposing (..)

import Shared.Types exposing (Customer, Coder)
import Time exposing (Time)


type Msg
    = NoOp
    | GenerateEbit Int
    | AddCoder Coder
    | Tick Time


type alias Model =
    { ebit : Int
    , ebitRate : Int
    , coders : List Coder
    }
