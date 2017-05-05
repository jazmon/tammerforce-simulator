module App.View exposing (..)

import Html exposing (..)
import App.Types exposing (Msg(..), Model)
import Html.Events exposing (onClick)
import Components.EbitButton as EbitButton


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ span [] [ text <| toString <| model.ebit ]
            ]
        , button [ onClick <| AddCoder { ebitRate = 2, cost = 1 } ] [ text "foo" ]
        , EbitButton.view model
        ]
