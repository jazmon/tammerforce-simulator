module App.View exposing (..)

import Html exposing (..)
import App.Types exposing (Msg, Model)
import Components.EbitButton as EbitButton


view : Model -> Html Msg
view model =
    EbitButton.view model
