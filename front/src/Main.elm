module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Article =
    { title : String
    , paragraphs : List String
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


main : Html msg
main =
    view 1


view model =
    article
        []
        [ header
            [ class "bg-gold sans-serif" ]
            [ div
                [ class "mw9 center pa4 pt5-ns ph7-l" ]
                [ time
                    [ class "f6 mb2 dib ttu tracked" ]
                    [ small
                        []
                        [ text "stackable shareable matrices" ]
                    ]
                , h3
                    [ class "f2 f1-m f-headline-l measure-narrow lh-title mv0" ]
                    [ span
                        [ class "bg-black-90 lh-copy white pa1 tracked-tight" ]
                        [ text "QGRID" ]
                    ]
                , h4
                    [ class "f3 fw1 georgia i" ]
                    [ text "Easily aggregate group feedback in matrix style surveys & assessments."
                    ]
                ]
            ]
        , div
            [ class "pa4 ph7-l georgia mw9-l center" ]
            [ p
                [ class "f5 f3-ns lh-copy measure georgia" ]
                [ text """I was on a hiring commitee once where we had to score candidates.
                    The group emailed a spreadsheet around. This process was ineffecient and
                    involved a lot of labor that could have been automatted. Enter the idea for qgrid."""
                ]
            , p
                [ class "f5 f3-ns lh-copy measure georgia" ]
                [ text """Let's try it out"""
                ]
            , table [] [ tr [] [ td [] [ text "demo coming soon" ] ] ]
            ]
        ]
