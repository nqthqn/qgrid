module Main exposing (..)

import App.View exposing (view)
import App.Model exposing (Model)
import App.Update exposing (update, Msg(..))


main : Html msg
main =
    view 1
