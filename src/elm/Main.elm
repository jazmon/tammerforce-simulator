module Main exposing (..)

import App.Types exposing (Model, Msg)
import App.State as State
import App.View as View
import Html exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = State.init
        , view = View.view
        , update = State.update
        , subscriptions = State.subscriptions
        }
