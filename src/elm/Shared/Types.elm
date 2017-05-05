module Shared.Types exposing (..)


type alias Coder =
    { ebitRate : Int
    , cost : Int
    , name: String
    }

type alias Applicant =
    { ebitRate: Int
    , cost : Int
    , name : String
    }




type alias CoderCreationTriggeringPayload =
  { ebitRate : Int, cost: Int }

type alias CoderCreationPayload =
  { ebitRate: Int, cost: Int, coderIndex : Int }

type alias Customer =
    { money : Int
    }
