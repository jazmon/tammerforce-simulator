module App.State exposing (..)
import App.Types exposing(..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Increment ->
            ( { model | ebit = model.ebit + 1 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : ( Model, Cmd Msg )
init =
    ( { coffee = 0, ebit = 0, customers = [] }, Cmd.none )
