module App.Types exposing (..)

import Shared.Types exposing (..)
import Time exposing (Time)
import Keyboard


type Msg
    = NoOp
    | GenerateEbit Int
    | TriggerAddCoder CoderCreationTriggeringPayload
    | AddCoder { coderIndex : Int }
    | Tick Time
    | KeyMsg Keyboard.KeyCode
    | UpgradeOffice Int Int


type alias Model =
    { ebit : Int
    , ebitRate : Int
    , coders : List Coder
    , applicant : Applicant
    , codePosition : Int
    }
