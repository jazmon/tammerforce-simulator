module App.State exposing (..)

import App.Types exposing (..)
import Time exposing (Time, second)
import Keyboard
import Code
import Shared.Data exposing (..)
import Shared.Types exposing (Coder)
import Debug exposing (log)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GenerateEbit amount ->
            ( { model
                | ebit = model.ebit + amount
                , codePosition = getCodeStringPos Code.code model.codePosition amount
              }
            , Cmd.none
            )

        TriggerAddCoder payload ->
            ( model, getRandomCoderIndex )

        AddCoder payload ->
          ( { model
            | coders = ( model.applicant :: model.coders )
            , ebit = (model.ebit - model.applicant.cost)
            , applicant = (getCoderByIndex payload.coderIndex)
            } , Cmd.none )

        Tick time ->
            ( model, (getRoundRandomFactor) )

        ExecuteRound payload ->
          let
            ebitRate = (List.sum <| List.map .ebitRate model.coders)
            roundResult = if ebitRate > 0 then payload.randomFactor + ebitRate else 0
          in
            ( { model
                | ebit = model.ebit + roundResult
                , previousRoundResult = roundResult
                , codePosition = getCodeStringPos Code.code model.codePosition (List.sum <| List.map .ebitRate model.coders)
              }
            , Cmd.none
            )

        KeyMsg keycode ->
            ( { model
                | ebit = model.ebit + model.ebitRate
                , previousRoundResult = model.previousRoundResult + 1
                , codePosition = getCodeStringPos Code.code model.codePosition model.ebitRate
              }
            , Cmd.none
            )

        UpgradeOffice extra cost ->
            ( { model | ebitRate = model.ebitRate + extra, ebit = model.ebit - cost }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every second Tick
        , Keyboard.downs KeyMsg
        ]


getCodeStringPos : String -> Int -> Int -> Int
getCodeStringPos string codePosition increase =
    let
        lineCount =
            getStringLineCount string
    in
        if codePosition >= (getStringLineCount string - 1 - increase) then
            1
        else
            codePosition + increase


getStringLineCount : String -> Int
getStringLineCount string =
    List.length <| String.split "\n" string


init : ( Model, Cmd Msg )
init =
    ( { ebitRate = 1
      , ebit = 0
      , knifeFactor = 0 -- the more knife factor the office has,
      , previousRoundResult = 0
      , coders = []
      -- the first applicant is hard coded in here because of... look, an aeroplane!?
      , applicant = { ebitRate = 1, cost = 1, name = "Summer Mickey", imageClass = "miro" }
      , codePosition = 0
      }
    , Cmd.none
    )
