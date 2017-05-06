module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import App.Types exposing (Msg(..), Model)
import Shared.Types exposing (..)
import Code
import Regex
import Array
import Components.CodeBlock
import Components.Stats
import Components.HireButton
import Components.Modal


view : Model -> Html Msg
view model =
    div []
        [ div [ class "container-fluid background" ]
            [ div [ class "row" ]
                [ div [ class "col-md-4 container" ]
                    [ Components.Stats.view model
                    , Components.HireButton.view
                    , button [ class "btn btn-primary", onClick <| UpgradeOffice 2 400 ] [ text "Upgrade Office" ]
                    ]
                , div [ class "col-md-6" ]
                    [ Components.CodeBlock.view (getCodeString Code.code model.codePosition) ]
                ]
            , if model.showEvent then
                div []
                    [ p [] [ text "foasdfasdfasdfasdfasdfasdfo" ]
                    , button
                        [ onClick <|
                            ChooseEventResolution
                                { description = "Foo"
                                , outcomeDescription = "foo"
                                , ebitDelta = 1000
                                , ebitRateDelta = 2
                                , knifeFactorDelta = 0
                                }
                        ]
                        [ text "foo" ]
                    ]
              else
                div [] []
            ]
        , Components.Modal.view model.applicant
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
