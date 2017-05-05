module Components.EbitButton exposing (..)

import Html exposing (Html, span, text, button)
import Html.Events exposing (onClick)
import App.Types exposing (Msg(..), Model)


view : Model -> Html Msg
view model =
    button [ onClick (GenerateEbit 1) ] [
        span [] [ text "EBIT" ]
    ]
