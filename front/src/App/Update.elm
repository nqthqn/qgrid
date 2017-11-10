module App.Update exposing (..)

import App.Model exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Edit ->
            ( { model | editable = flipEditing model.editable }, Cmd.none )

        Set s ->
            ( { model | editable = setCurr model.editable s }, Cmd.none )

        Save ->
            ( { model | editable = save model.editable }, Cmd.none )

        Cancel ->
            ( { model | editable = cancel model.editable }, Cmd.none )


flipEditing e =
    { e | editing = not e.editing }


setCurr e s =
    { e | curr = s }


save e =
    { e | editing = False, prev = e.curr }


cancel e =
    { e | editing = False, curr = e.prev }
