module App.State exposing (..)

import App.Types exposing (..)
import Time exposing (Time, second)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GenerateEbit amount ->
            ( { model | ebit = model.ebit + amount }, Cmd.none )

        AddCoder coder ->
            ( { model | coders = coder :: model.coders }, Cmd.none )

        Tick time ->
            ( { model | ebit = model.ebit + (List.sum <| List.map .ebitRate model.coders) }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick


init : ( Model, Cmd Msg )
init =
    ( { ebitRate = 0, ebit = 0, coders = [] }, Cmd.none )
