module App.Types exposing (..)


type Msg
    = NoOp
    | Increment


type alias Model =
    { coffee : Int
    , ebit : Int
    , customers : List Customer
    }

-- Move to Shared.Types
type alias Customer =
    { money : Int
    }
