module App.Types exposing (..)

import Shared.Types exposing (Coder)
import Time exposing (Time)
import Keyboard


type Msg
    = NoOp
    | GenerateEbit Int
    | AddCoder Coder
    | Tick Time
    | KeyMsg Keyboard.KeyCode
    | UpgradeGear Int


type alias Model =
    { ebit : Int
    , ebitRate : Int
    , coders : List Coder
    }
