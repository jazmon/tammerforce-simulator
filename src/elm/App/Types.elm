module App.Types exposing (..)

import Shared.Types exposing (..)
import Time exposing (Time)
import Keyboard


type Msg
    = NoOp
    | GenerateEbit Int
    | TriggerAddCoder CoderCreationTriggeringPayload
    | AddCoder CoderCreationPayload
    | Tick Time
    | KeyMsg Keyboard.KeyCode
    | UpgradeOffice Int


type alias Model =
    { ebit : Int
    , ebitRate : Int
    , coders : List Coder
    , applicant : Applicant
    , codePosition : Int
    }
