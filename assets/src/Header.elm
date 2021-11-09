module Header exposing (layout)

import Html exposing (Html, div)
import Html.Attributes exposing (class)


header : Html msg
header =
    div [ class "h-32 px-3 bg-blue-400 w-screen flex flex-row items-center justify-between" ]
        [ div [ class "rounded-full p-3 h-8 w-8 bg-blue-800" ] []
        , div [ class "rounded-full p-3 h-8 w-8 bg-blue-300" ] []
        ]


layout : List (Html msg) -> Html msg
layout toR =
    div []
        [ header
        , div [] toR
        ]
