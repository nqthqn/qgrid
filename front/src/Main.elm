module Main exposing (..)

import App.Model exposing (initModel)
import App.Update exposing (update)
import App.View exposing (view)
import Html exposing (program)


main =
    program
        { update = update
        , view = view
        , init = ( initModel, Cmd.none )
        , subscriptions = always Sub.none
        }
