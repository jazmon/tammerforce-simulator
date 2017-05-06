module App.Types exposing (..)

import Shared.Types exposing (..)
import Time exposing (Time)
import Keyboard


type alias EventResolution =
    Int


type Msg
    = NoOp
    | GenerateEbit Int
    | TriggerAddCoder CoderCreationTriggeringPayload
    | AddCoder { coderIndex : Int }
    | ExecuteRound { randomFactor : Int }
    | Tick Time
    | KeyMsg Keyboard.KeyCode
    | UpgradeOffice Int Int
    | TickEvent Time
    | ChooseEventResolution EventResolution


type alias Model =
    { ebit : Int
    , ebitRate : Int
    , knifeFactor : Int
    , previousRoundResult : Int
    , coders : List Coder
    , applicant : Applicant
    , codePosition : Int
    , showEvent : Bool
    }
