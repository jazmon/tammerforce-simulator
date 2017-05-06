module Shared.Types exposing (..)


type alias Coder =
    { ebitRate : Int
    , cost : Int
    , name : String
    , imageClass : String
    }

type alias Applicant =
    { ebitRate: Int
    , cost : Int
    , name : String
    , imageClass : String
    }

type alias CoderCreationTriggeringPayload =
  { ebitRate : Int, cost: Int }

type alias CoderCreationPayload =
  { ebitRate: Int, cost: Int, coderIndex : Int }

type alias Customer =
    { money : Int
    }


type alias Event =
    { description : String
    , options : List Option
    }

type alias Option =
    { description : String
    , ebitDelta : Int
    , ebitRateDelta : Int
    , knifeFactorDelta : Int
    }
