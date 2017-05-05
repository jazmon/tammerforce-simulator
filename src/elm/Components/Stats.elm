module Components.Stats exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Types exposing (Msg(..), Model)


view : Model -> Html Msg
view model =
    div []
        [ span [ class "stats-label" ]
            [ text "EBIT"
            , br [] []
            , span [ class "stats-value" ] [ text <| toString <| model.ebit ]
            , span [] [ text " k€" ]
            ]
        , br [] []
        , span [ class "stats-label small" ] [ text "Yesterday's EBIT" ]
        , br [] []
        , span [ class "stats-value small" ] [ text <| toString <| model.previousRoundResult ]

        , br [] []
        , span [ class "stats-label" ] [ text "Coders" ]
        , br [] []
        , span [ class "stats-value" ] [ text <| toString <| List.length model.coders ]
        , br [] []
        , span [ class "stats-label" ] [ text "Office level" ]
        , br [] []
        , span [ class "stats-value" ] [ text <| toString <| model.ebitRate ]
        ]
