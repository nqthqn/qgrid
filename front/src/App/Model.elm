module App.Model exposing (..)


type Msg
    = Edit
    | Set String
    | Save
    | Cancel


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
    , name : String
    , sort : Int
    }


type alias Col =
    { id : Int
    , name : String
    , sort : Int
    , options : Maybe Options
    }


type alias Matrix =
    { id : Maybe Int
    , name : String
    , rows : List Row
    , cols : List Col
    , active : Bool
    }



-- init


initMatrix =
    { id = Nothing
    , name = ""
    , rows = []
    , cols = []
    , active = False
    }


initEditable =
    { prev = "Edit me"
    , curr = "Edit me"
    , editing = False
    }


initModel =
    { matrices = []
    , matrix = initMatrix
    , status = ""
    , editable = initEditable
    }
