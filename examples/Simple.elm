module Main exposing (..)

import Html as H
import Html.Events exposing (onClick)


--

import WebAudio exposing (OscillatorNode, AudioContext(..), stopOscillator, setValue, startOscillator, getDestinationNode, connectNodes, OscillatorWaveType(..), createOscillatorNode)


main : Program Never Model Msg
main =
    H.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    ()


init : ( Model, Cmd Msg )
init =
    ( (), Cmd.none )



-- UPDATE


type Msg
    = Play


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Play ->
            (createOscillatorNode DefaultContext Sine
                |> connectNodes (getDestinationNode DefaultContext) 0 0
                |> startOscillator 0.0
                |> stopOscillator 1.0
            )
                ! []



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> H.Html Msg
view model =
    H.button [ onClick Play ] [ H.text "Play" ]
