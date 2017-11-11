module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import App.Model exposing (..)


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
            [ qgrid3 model.matrix
            ]
        ]



{-
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
-}
{- TODO user matrix.newRow and matrix.newCol with Msg:

   | SetNewRow String
   | SetNewCol String
   | ToggleNewRow
   | ToggleNewCol
   | SaveRow Row
   | SaveCol Col

   So you can add to the matrix

-}


qgrid3 matrix =
    table [ class "qgrid" ]
        ([ qgridCols matrix.cols
         ]
            ++ (qgridRows (List.length matrix.cols) matrix.rows)
        )


qgridCols cols =
    tr [] <|
        [ td [] [ text "" ] ]
            ++ (List.map (\col -> td [] [ a [ href "#" ] [ editableText (Cols col.id) col.name ] ]) cols)


qgridRows len rows =
    List.map
        (\row ->
            tr []
                ([ td [] [ a [ href "#" ] [ editableText (Rows row.id) row.name ] ]
                 ]
                    ++ (List.repeat len (td [] [ text "" ]))
                )
        )
        rows


editableText : GridPart -> Editable -> Html Msg
editableText gp e =
    if e.editing then
        div []
            [ input [ type_ "text", value e.curr, onInput (Set gp) ] []
            , button [ onClick (Save gp) ] [ text "save" ]
            , button [ onClick (Cancel gp) ] [ text "cancel" ]
            ]
    else
        div [] [ a [ onClick (Edit gp), href "#" ] [ text e.curr ] ]
