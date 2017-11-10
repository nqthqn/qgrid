module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Model exposing (Model, Msg(..))


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
                [ text "building a grid!"
                , a [ href "https://ellie-app.com/hs7h8ktwba1/1" ] [ text "editable text elm app" ]
                ]
            , qgrid
            , p
                [ class "f5 f3-ns lh-copy measure georgia" ]
                [ text "empty  state"
                ]
            , qgrid2
            , editableText model.editable
            ]
        ]


qgrid2 =
    table [ class "qgrid" ]
        [ tr []
            [ td [] [ text "" ]
            , td [] [ button [] [ text "+" ] ]
            ]
        , tr []
            [ td [] [ button [] [ text "+" ] ]
            , td [] [ text "" ]
            ]
        ]


qgrid =
    table [ class "qgrid" ]
        [ tr []
            [ td [] [ text "" ]
            , td [] [ a [ href "#" ] [ text "header1" ] ]
            , td [] [ a [ href "#" ] [ text "header2" ] ]
            , td []
                [ input [ type_ "text", value "header3" ] []
                , select []
                    [ option [] [ text "text" ]
                    , option [] [ text "rating" ]
                    , option [] [ text "options" ]
                    ]
                ]
            , td [] [ button [] [ text "+" ] ]
            ]
        , tr []
            [ td [] [ a [ href "#" ] [ text "row1" ] ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            ]
        , tr []
            [ td [] [ input [ type_ "text", value "row 2" ] [] ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            ]
        , tr []
            [ td [] [ a [ href "#" ] [ text "row3" ] ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            ]
        , tr []
            [ td [] [ button [] [ text "+" ] ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            , td [] [ text "" ]
            ]
        ]


editableText e =
    if e.editing then
        div []
            [ input [ type_ "text", value e.curr, onInput Set ] []
            , button [ onClick Save ] [ text "save" ]
            , button [ onClick Cancel ] [ text "cancel" ]
            ]
    else
        div [] [ a [ onClick Edit, href "#" ] [ text e.curr ] ]
