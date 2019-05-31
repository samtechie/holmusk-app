module Main exposing (main)

import Browser
import Html exposing (div, h1, section, text)
import Html.Attributes exposing (class)


main =
    section [ class "section" ]
        [ div [ class "container" ]
            [ h1 [ class "title" ]
                [ text "Hello, Elm App Starter" ]
            ]
        ]
