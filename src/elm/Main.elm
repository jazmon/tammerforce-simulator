module Main exposing (..)
import App.Types exposing (Model, Msg)
import App.State as State
import App.View as View
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    Html.program
        { init = State.init
        , view = View.view
        , update = State.update
        , subscriptions = State.subscriptions
        }
