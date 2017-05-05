module App.State exposing (..)

import App.Types exposing (..)
import Time exposing (Time, second)
import Keyboard

import Shared.Data exposing (..)
import Shared.Types exposing (Coder)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GenerateEbit amount ->
            ( { model | ebit = model.ebit + amount }, Cmd.none )

        -- AddCoder coder ->
        --     ( { model
        --         | coders = coder :: model.coders
        --         , ebit = model.ebit - coder.cost
        --       }
        --     , Cmd.none
        --     )
        TriggerAddCoder payload ->
            ( model, (getRandomCoderIndex payload) )

        AddCoder payload ->
          ( { model | coders = (( Coder payload.ebitRate payload.cost (getCoderByIndex payload.coderIndex) ) :: model.coders )
                    , ebit = model.ebit - payload.cost}, Cmd.none )

        Tick time ->
            ( { model | ebit = model.ebit + (List.sum <| List.map .ebitRate model.coders) }, Cmd.none )

        KeyMsg keycode ->
            ( { model | ebit = model.ebit + model.ebitRate }, Cmd.none )

        UpgradeGear extra ->
            ( { model | ebitRate = model.ebitRate + extra }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every second Tick
        , Keyboard.downs KeyMsg
        ]


init : ( Model, Cmd Msg )
init =
    ( { ebitRate = 0, ebit = 0, coders = [], applicant = { ebitRate = 3 , cost = 150 , name = "Hessu Kypärä"} }, Cmd.none )
