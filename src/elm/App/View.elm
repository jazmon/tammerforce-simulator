module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Types exposing (Msg(..), Model)
import Html.Events exposing (onClick)
import Components.EbitButton as EbitButton
import Code


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ span [] [ text <| toString <| model.ebit ]
            ]
        , button [ onClick <| AddCoder { ebitRate = 2, cost = 1 } ] [ text "foo" ]
        , EbitButton.view model
        , div []
            [ pre
                []
                [ Html.code
                    [ class "java" ]
                    [ text <| String.slice 0 (model.ebit * 10) Code.code ]
                ]
            ]
        ]
