module App.State exposing (..)

import App.Types exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GenerateEbit amount ->
            ( { model | ebit = model.ebit + amount }, Cmd.none )

        AddCoder coder ->
            ( { model | coders = coder :: model.coders }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : ( Model, Cmd Msg )
init =
    ( { ebitRate = 0, ebit = 0, coders = [] }, Cmd.none )
