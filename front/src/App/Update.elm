module Update exposing (..)


type Msg
    = SetRowName Int String
    | SetColName Int String
    | AddRow Int
    | AddCol Int
    | AddMatrix
    | SaveMatrix
    | SaveOptions Int
    | OpenOptions Int
    | OpenOption
    | SaveOption
    | SetOptionName String


update model msg =
    ( model, Cmd.none )
