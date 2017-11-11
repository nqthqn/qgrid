module App.Util exposing (..)

import App.Model exposing (Matrix, GridPart(..), Editable)


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
    if name.curr == "" then
        { name | status = "Can't be blank" }
    else
        { name | prev = name.curr, editing = False }


cancel : Action
cancel name =
    if name.prev == "" then
        { name | status = "Can't be blank" }
    else
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


addRow row matrix =
    { matrix | rows = matrix.rows ++ [ row (newId matrix.rows) ] }


addCol col matrix =
    { matrix | cols = matrix.cols ++ [ col (newId matrix.cols) ] }



-- VERY BAD!!!!


newId parts =
    parts
        |> List.map .id
        |> List.maximum
        |> Maybe.withDefault 124123
        |> (+) 1


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
