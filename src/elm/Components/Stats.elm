module Components.Stats exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Types exposing (Msg(..), Model)


view : Model -> Html Msg
view model =
    div [ class "stats-container" ] [
        span [ class "stats-label" ] [ text "EBIT"]
        , br [] []
        , span [ class "stats-value" ] [ text <| toString <| model.ebit ]
        , br [] []
        , span [ class "stats-label" ] [ text "Coders"]
        , br [] []
        , span [ class "stats-value" ] [ text <| toString  <| List.length model.coders ]
    ]
