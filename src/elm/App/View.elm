module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Types exposing (Msg(..), Model)
import Html.Events exposing (onClick)
import Code
import Regex
import Array


view : Model -> Html Msg
view model =
    let
        splitRegex =
            Regex.regex "\n"

        codeChunks =
            Array.fromList <| Regex.split Regex.All (splitRegex) Code.code

        rowCount =
            8

        codeString =
            String.join "\n" <| List.take model.ebit <| Array.toList <| Array.slice (Basics.max 0 (model.ebit - rowCount)) (model.ebit + (rowCount * 2)) codeChunks
    in
        div [ class "container-fluid" ]
            [ div [ class "container" ]
                [ span [] [ text <| toString <| model.ebit ]
                ]
            , button [ onClick <| AddCoder { ebitRate = 2, cost = 1 } ] [ text "Hire a coder" ]
            , div [ class "container" ]
                [ pre
                    [ class "code-block" ]
                    [ Html.code
                        []
                        [ text codeString ]
                    ]
                ]
            ]
