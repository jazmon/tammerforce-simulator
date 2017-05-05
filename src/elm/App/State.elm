module App.State exposing (..)

import App.Types exposing (..)
import Time exposing (Time, second)
import Keyboard
import Code
import Shared.Data exposing (..)
import Shared.Types exposing (Coder)


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
            ( model, (getRandomCoderIndex payload) )

        AddCoder payload ->
          ( { model
            | coders = (( Coder model.applicant.ebitRate model.applicant.cost model.applicant.name ) :: model.coders )
            , ebit = (model.ebit - payload.cost)
            , applicant =
              { ebitRate = payload.ebitRate
              , cost = payload.cost
              , name = (getCoderByIndex payload.coderIndex)
              }
            } , Cmd.none )

        Tick time ->
            ( { model | ebit = model.ebit + (List.sum <| List.map .ebitRate model.coders) }, Cmd.none )

        KeyMsg keycode ->
            ( { model
                | ebit = model.ebit + model.ebitRate
                , codePosition = getCodeStringPos Code.code model.codePosition model.ebitRate
              }
            , Cmd.none
            )

        UpgradeGear extra ->
            ( { model | ebitRate = model.ebitRate + extra }, Cmd.none )


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
  -- the first applicant is hard coded in here because of... look, an aeroplane!?
    ( { ebitRate = 0, ebit = 0, coders = [], applicant = { ebitRate = 3 , cost = 150 , name = "Summer Mickey"}, codePosition = 0 }, Cmd.none )
