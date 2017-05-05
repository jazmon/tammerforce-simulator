module App.Types exposing (..)
import Shared.Types exposing (Customer)

type Msg
    = NoOp
    | Increment


type alias Model =
    { coffee : Int
    , ebit : Int
    , customers : List Customer
    }
