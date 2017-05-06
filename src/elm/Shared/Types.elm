module Shared.Types exposing (..)


type alias Coder =
    { ebitRate : Int
    , cost : Int
    , name : String
    , imageClass : String
    }


type alias Applicant =
    { ebitRate : Int
    , cost : Int
    , name : String
    , imageClass : String
    }


type alias CoderCreationTriggeringPayload =
    { ebitRate : Int, cost : Int }


type alias CoderCreationPayload =
    { ebitRate : Int, cost : Int, coderIndex : Int }


type alias Customer =
    { money : Int
    }


type alias Event =
    { description : String
    , options : List Option
    }


type alias Option =
    { description : String -- what this option says it will do
    , outcomeDescription : String -- what will happen if this is selected

    -- the outcome to the state if this option is selected:
    , ebitDelta : Int
    , knifeFactorDelta : Int
    , ebitRateDelta : Int
    }
