module Model exposing (..)


type alias Model =
    { matrices : List Matrix
    , matrix : Matrix
    , status : String
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
    { id : Int
    , name : String
    , rows : List Row
    , cols : List Col
    , active : Bool
    }
