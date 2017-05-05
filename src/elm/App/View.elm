module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Types exposing (Msg(..), Model)
import Html.Events exposing (onClick)
import Code
import Regex
import Array
import Components.CodeBlock
import Components.Stats


view : Model -> Html Msg
view model =
    let
        codeString =
            getCodeString Code.code model.ebit

        newCoder =
            { ebitRate = 2, cost = 100 }
    in
        div [ class "container-fluid background" ]
            [ div [ class "container" ]
                [ Components.Stats.view model
                ]
            , button [ onClick <| AddCoder newCoder ] [ text "Hire a coder" ]
            , button [ onClick <| UpgradeGear 2 ] [ text "Upgrade gear" ]
            , Components.CodeBlock.view codeString
            ]


getCodeString : String -> Int -> String
getCodeString code amount =
    let
        splitRegex =
            Regex.regex "\n"

        codeChunks =
            Regex.split Regex.All (splitRegex) code |> Array.fromList

        rowCount =
            8
    in
        Array.slice (Basics.max 0 (amount - rowCount)) (amount + (rowCount * 2)) codeChunks
            |> Array.toList
            |> List.take amount
            |> String.join "\n"
