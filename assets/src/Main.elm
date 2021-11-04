module Main exposing (Model, Msg, init, main, subscriptions, view)

import Browser exposing (Document)
import Browser.Navigation as Nav
import Debug exposing (toString)
import Graphql exposing (Response, query)
import Graphql.Http
import Html exposing (..)
import Html.Attributes exposing (..)
import RemoteData exposing (RemoteData(..))
import Url



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse response ->
            ( { model | res = response }, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }, Cmd.none )



-- MODEL


type alias Model =
    { res : RemoteData (Graphql.Http.Error Response) Response
    , key : Nav.Key
    , url : Url.Url
    }


makeRequest : Cmd Msg
makeRequest =
    query
        |> Graphql.Http.queryRequest "http://localhost:4000/api/graphql"
        |> Graphql.Http.send (RemoteData.fromResult >> GotResponse)


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model NotAsked key url, makeRequest )



-- UPDATE


type Msg
    = GotResponse (RemoteData (Graphql.Http.Error Response) Response)
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Document Msg
view model =
    { title = "a page"
    , body =
        [ case model.res of
            NotAsked ->
                div [] [ text "real shit" ]

            Loading ->
                div [] [ text "some this" ]

            Failure err ->
                div [] [ text (Debug.toString err) ]

            Success a ->
                div []
                    [ div []
                        (a
                            |> List.map
                                (\l ->
                                    div [ class "font-bold" ]
                                        [ text l.title
                                        , text " - "
                                        , text l.content
                                        , text ". Amount of likes: "
                                        , text
                                            (case l.likes of
                                                Just amount_likes ->
                                                    toString amount_likes

                                                Nothing ->
                                                    "No likes yet"
                                            )
                                        ]
                                )
                        )
                    , text "The link is: "
                    , b [] [ text (Url.toString model.url) ]
                    , ul []
                        [ viewLink "/donger"
                        , viewLink "/very/nice"
                        ]
                    ]
        ]
    }


viewLink : String -> Html msg
viewLink path =
    li [] [ a [ href path ] [ text path ] ]
