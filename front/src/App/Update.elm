module App.Update exposing (..)

import App.Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Edit gp ->
            ( { model | matrix = modMatrix model.matrix gp flipEditing }, Cmd.none )

        Set gp s ->
            ( { model | matrix = modMatrix model.matrix gp (setCurr s) }, Cmd.none )

        Save gp ->
            ( { model | matrix = modMatrix model.matrix gp save }, Cmd.none )

        Cancel gp ->
            ( { model | matrix = modMatrix model.matrix gp cancel }, Cmd.none )

        ToggleNewRow ->
            ( { model | matrix = toggleNewRow model.matrix }, Cmd.none )

        ToggleNewCol ->
            ( { model | matrix = toggleNewCol model.matrix }, Cmd.none )

        SetNewRow string ->
            ( { model | matrix = setNewRow model.matrix string }, Cmd.none )

        SetNewCol string ->
            ( { model | matrix = setNewCol model.matrix string }, Cmd.none )

        SaveRow row ->
            ( { model | matrix = addRow model.matrix row }, Cmd.none )

        SaveCol col ->
            ( { model | matrix = addCol model.matrix col }, Cmd.none )


type alias Action =
    Editable -> Editable


flipEditing : Action
flipEditing name =
    { name | editing = not name.editing }


setCurr : String -> Action
setCurr string name =
    { name | curr = string }


save : Action
save name =
    { name | prev = name.curr, editing = False }


cancel : Action
cancel name =
    { name | curr = name.prev, editing = False }


modCells : Action -> Int -> List { c | name : Editable, id : Int } -> List { c | name : Editable, id : Int }
modCells action id =
    List.map
        (\cell ->
            if cell.id == id then
                { cell | name = action cell.name }
            else
                cell
        )


modMatrix : Matrix -> GridPart -> Action -> Matrix
modMatrix matrix gp action =
    case gp of
        Rows id ->
            { matrix | rows = modCells action id matrix.rows }

        Cols id ->
            { matrix | cols = modCells action id matrix.cols }


addRow matrix row =
    { matrix | rows = matrix.rows ++ [ row ] }


addCol matrix col =
    { matrix | cols = matrix.cols ++ [ col ] }


setNewRow matrix string =
    { matrix | newRow = Just string }


setNewCol matrix string =
    { matrix | newCol = Just string }


toggleNewRow matrix =
    case matrix.newRow of
        Just _ ->
            { matrix | newRow = Nothing }

        Nothing ->
            { matrix | newRow = Just "" }


toggleNewCol matrix =
    case matrix.newCol of
        Just _ ->
            { matrix | newCol = Nothing }

        Nothing ->
            { matrix | newCol = Just "" }
