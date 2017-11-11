module App.Update exposing (..)

import App.Model exposing (..)
import App.Util as Util


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Edit gp ->
            ( { model | matrix = Util.modMatrix model.matrix gp Util.flipEditing }, Cmd.none )

        Set gp s ->
            ( { model | matrix = Util.modMatrix model.matrix gp (Util.setCurr s) }, Cmd.none )

        Save gp ->
            ( { model | matrix = Util.modMatrix model.matrix gp Util.save }, Cmd.none )

        Cancel gp ->
            ( { model | matrix = Util.modMatrix model.matrix gp Util.cancel }, Cmd.none )

        ModifyMatrix func ->
            ( { model | matrix = func model.matrix }, Cmd.none )
