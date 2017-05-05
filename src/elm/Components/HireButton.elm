module Components.HireButton exposing (view)

import Html exposing (Html, span, text, button)
import App.Types exposing (Msg(..), Model)
import Html.Attributes exposing (..)


view : Html Msg
view =
    button
      [ type_ "button", class "btn btn-primary", attribute "data-toggle" "modal", attribute "data-target" "#modal" ]
      [ text "Recruit" ]
