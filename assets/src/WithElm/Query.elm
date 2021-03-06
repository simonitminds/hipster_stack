-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module WithElm.Query exposing (..)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)
import WithElm.InputObject
import WithElm.Interface
import WithElm.Object
import WithElm.Scalar
import WithElm.ScalarCodecs
import WithElm.Union


posts :
    SelectionSet decodesTo WithElm.Object.Post
    -> SelectionSet (List decodesTo) RootQuery
posts object____ =
    Object.selectionForCompositeField "posts" [] object____ (Basics.identity >> Decode.list)
