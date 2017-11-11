module App.Model exposing (..)


type Msg
    = Edit GridPart
    | Set GridPart String
    | Save GridPart
    | Cancel GridPart
    | SetNewRow String
    | SetNewCol String
    | ToggleNewRow
    | ToggleNewCol
    | SaveRow Row
    | SaveCol Col


type GridPart
    = Rows Int
    | Cols Int


type alias Model =
    { matrices : List Matrix
    , matrix : Matrix
    , status : String
    , editable : Editable
    }


type alias Editable =
    { prev : String
    , curr : String
    , editing : Bool
    }


type alias Option =
    { id : Int
    , key : String
    , value : String
    , sort : Int
    }


type alias Options =
    { id : Int
    , key : String
    , value : String
    , options : List Option
    }


type alias Row =
    { id : Int
    , name : Editable
    , sort : Int
    }


type alias Col =
    { id : Int
    , name : Editable
    , sort : Int
    , options : Maybe Options
    }


type alias Matrix =
    { id : Maybe Int
    , name : Editable
    , rows : List Row
    , cols : List Col
    , active : Bool
    , newRow : Maybe String
    , newCol : Maybe String
    }



-- init


cols =
    [ { id = 23
      , name = editableText "Skill Level"
      , sort = 1
      , options = Nothing
      }
    , { id = 232
      , name = editableText "Height"
      , sort = 2
      , options = Nothing
      }
    ]


rows =
    [ { id = 1
      , name = editableText "Nate"
      , sort = 1
      }
    , { id = 2
      , name = editableText "Bob"
      , sort = 2
      }
    , { id = 3
      , name = editableText "Suzy"
      , sort = 3
      }
    ]


initMatrix =
    { id = Just 123
    , name = editableText "Test"
    , rows = rows
    , cols = cols
    , active = False
    , newRow = Nothing
    , newCol = Nothing
    }


initEditable =
    editableText "Edit me"


editableText : String -> Editable
editableText string =
    { prev = string
    , curr = string
    , editing = False
    }


initModel =
    { matrices = []
    , matrix = initMatrix
    , status = ""
    , editable = initEditable
    }
