module Graphql exposing (..)

import Graphql.Operation exposing (RootQuery)
import Graphql.SelectionSet as SelectionSet exposing (SelectionSet)
import WithElm.Object
import WithElm.Object.Post as Post
import WithElm.Query as Query


type alias Response =
    List Post


query : SelectionSet Response RootQuery
query =
    Query.posts postSelection


postSelection : SelectionSet Post WithElm.Object.Post
postSelection =
    SelectionSet.map3 Post
        Post.content
        Post.likes
        Post.title


type alias Post =
    { content : String
    , likes : Maybe Int
    , title : String
    }
