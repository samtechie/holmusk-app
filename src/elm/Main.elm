module Main exposing (main)

import Browser
import Browser.Events as Events
import Dict exposing (Dict)
import Html exposing (Html, button, div, h1, i, input, label, p, section, span, text)
import Html.Attributes exposing (attribute, checked, class, id, type_)
import Html.Events exposing (onClick)
import Json.Decode as D exposing (value)


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { options : Dict.Dict Option Bool
    , options1 : Dict.Dict Option Bool
    , options2 : Dict.Dict Option Bool
    , options3 : Dict.Dict Option Bool
    , dropdowns : Dict.Dict Dropdown Bool
    }


initialModel : Model
initialModel =
    { options =
        Dict.fromList
            [ ( "Option 1", False )
            , ( "Option 2", False )
            , ( "Option 3", False )
            , ( "Option 4", False )
            , ( "Option 5", False )
            ]
    , options1 =
        Dict.fromList
            [ ( "Option 1", False )
            , ( "Option 2", False )
            , ( "Option 3", False )
            , ( "Option 4", False )
            , ( "Option 5", False )
            ]
    , options2 =
        Dict.fromList
            [ ( "Option 1", False )
            , ( "Option 2", False )
            , ( "Option 3", False )
            , ( "Option 4", False )
            , ( "Option 5", False )
            ]
    , options3 =
        Dict.fromList
            [ ( "Option 1", False )
            , ( "Option 2", False )
            , ( "Option 3", False )
            , ( "Option 4", False )
            , ( "Option 5", False )
            ]
    , dropdowns =
        Dict.fromList
            [ ( "dropdown-menu1", False )
            , ( "dropdown-menu2", False )
            , ( "dropdown-menu3", False )
            , ( "dropdown-menu4", False )
            ]
    }


type alias Option =
    String


type alias Dropdown =
    String


type alias Flags =
    ()


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


type Msg
    = NoOp
    | ToggleOptions Option
    | ToggleOptions1 Option
    | ToggleOptions2 Option
    | ToggleOptions3 Option
    | ToggleDropdowns Dropdown
    | ClickOut


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ToggleOptions option ->
            ( { model | options = toggle option model.options }, Cmd.none )

        ToggleOptions1 option ->
            ( { model | options1 = toggle option model.options1 }, Cmd.none )

        ToggleOptions2 option ->
            ( { model | options2 = toggle option model.options2 }, Cmd.none )

        ToggleOptions3 option ->
            ( { model | options3 = toggle option model.options3 }, Cmd.none )

        ToggleDropdowns dropdown ->
            ( { model | dropdowns = toggle dropdown model.dropdowns }, Cmd.none )

        ClickOut ->
            ( { model | dropdowns = closeDropdowns model.dropdowns }, Cmd.none )



-- HELPERS


toggle : comparable -> Dict.Dict comparable Bool -> Dict.Dict comparable Bool
toggle key dict =
    Dict.update key
        (\oldValue ->
            Maybe.map not oldValue
        )
        dict


closeDropdowns : Dict a Bool -> Dict a Bool
closeDropdowns dropdowns =
    Dict.map (\_ value -> value == False) dropdowns


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Browser.Document Msg
view model =
    { title = "Holmusk app"
    , body =
        [ section [ class "section" ]
            [ div [ class "container " ]
                [ div [ class "columns is-centered box" ]
                    [ div [ class "column " ]
                        [ h1 [] [ text "OVERALL" ]
                        , text "Selected:"
                        , div []
                            (List.map
                                (\option ->
                                    let
                                        value =
                                            Dict.get option model.options
                                    in
                                    if value == Just True then
                                        text <| " " ++ option

                                    else
                                        text " "
                                )
                                (Dict.keys model.options)
                            )
                        ]
                    , dropdownElement "dropdown-menu1" model model.options ToggleOptions
                    ]
                , div [ class "columns is-centered has-background-grey-lighter" ]
                    [ div [ class "column is-full" ]
                        [ h1 [] [ text "BREAKDOWN" ]
                        , p [ class "has-text-grey-dark" ] [ text "Select the options from the dropdown menu" ]
                        , div [ class "tile is-ancestor" ]
                            [ div [ class "tile is-parent" ]
                                [ div [ class "tile is-child box" ]
                                    [ div [ class "columns" ]
                                        [ div [ class "column" ]
                                            [ h1 [] [ text "CATEGORY 1" ]
                                            , text "Selected:"
                                            , div []
                                                (List.map
                                                    (\option ->
                                                        let
                                                            value =
                                                                Dict.get option model.options1
                                                        in
                                                        if value == Just True then
                                                            text <| " " ++ option

                                                        else
                                                            text " "
                                                    )
                                                    (Dict.keys model.options1)
                                                )
                                            ]
                                        , dropdownElement "dropdown-menu2" model model.options1 ToggleOptions1
                                        ]
                                    ]
                                ]
                            ]
                        , div [ class "tile is-ancestor" ]
                            [ div [ class "tile is-parent" ]
                                [ div [ class "tile is-child box" ]
                                    [ div [ class "columns" ]
                                        [ div [ class "column" ]
                                            [ h1 []
                                                [ text "CATEGORY 2"
                                                ]
                                            , text "Selected:"
                                            , div []
                                                (List.map
                                                    (\option ->
                                                        let
                                                            value =
                                                                Dict.get option model.options2
                                                        in
                                                        if value == Just True then
                                                            text <| " " ++ option

                                                        else
                                                            text " "
                                                    )
                                                    (Dict.keys model.options2)
                                                )
                                            ]
                                        , dropdownElement "dropdown-menu3" model model.options2 ToggleOptions2
                                        ]
                                    ]
                                , div [ class "tile is-child  box" ]
                                    [ div [ class "columns" ]
                                        [ div [ class "column" ]
                                            [ h1 [] [ text "CATEGORY 3" ]
                                            , text "Selected:"
                                            , div []
                                                (List.map
                                                    (\option ->
                                                        let
                                                            value =
                                                                Dict.get option model.options3
                                                        in
                                                        if value == Just True then
                                                            text <| " " ++ option

                                                        else
                                                            text " "
                                                    )
                                                    (Dict.keys model.options3)
                                                )
                                            ]
                                        , dropdownElement "dropdown-menu4" model model.options3 ToggleOptions3
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    }


dropdownElement : Dropdown -> Model -> Dict.Dict Option Bool -> (Option -> Msg) -> Html Msg
dropdownElement dropdown model options toMsg =
    let
        dropdownValue =
            Dict.get dropdown model.dropdowns
    in
    if dropdownValue == Just True then
        div [ class "dropdown is-right is-active" ]
            [ div [ class "dropdown-trigger" ]
                [ button [ class "button", attribute "aria-haspopup" "true", attribute "aria-controls" dropdown, onClick <| ToggleDropdowns dropdown ]
                    [ span [] [ text "COMPARE" ]
                    , span [ class "icon is-small" ]
                        [ i [ class "fas fa-angle-down", attribute "aria-hidden" "true" ] []
                        ]
                    ]
                ]
            , div [ class "dropdown-menu", id dropdown, attribute "role" "menu" ]
                [ div [ class "dropdown-content" ]
                    (List.map
                        (\option ->
                            let
                                optionValue =
                                    Dict.get option options
                            in
                            div [ class "dropdown-item" ]
                                [ label [ class "checkbox" ]
                                    [ input [ type_ "checkbox", checked <| Maybe.withDefault False optionValue, onClick <| toMsg option ] [], text <| " " ++ option ]
                                ]
                        )
                        (Dict.keys options)
                    )
                ]
            ]

    else
        div [ class "dropdown is-right " ]
            [ div [ class "dropdown-trigger" ]
                [ button [ class "button", attribute "aria-haspopup" "true", attribute "aria-controls" dropdown, onClick <| ToggleDropdowns dropdown ]
                    [ span [] [ text "COMPARE" ]
                    , span [ class "icon is-small" ]
                        [ i [ class "fas fa-angle-down", attribute "aria-hidden" "true" ] []
                        ]
                    ]
                ]
            ]
