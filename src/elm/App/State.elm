module App.State exposing (..)

import App.Types exposing (..)
import Time exposing (Time, second)
import Keyboard


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GenerateEbit amount ->
            ( { model | ebit = model.ebit + amount }, Cmd.none )

        AddCoder coder ->
            ( { model
                | coders = coder :: model.coders
                , ebit = model.ebit - coder.cost
              }
            , Cmd.none
            )

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
    ( { ebitRate = 1, ebit = 0, coders = [] }, Cmd.none )
