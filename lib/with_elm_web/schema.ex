defmodule WithElmWeb.Schema do
  use Absinthe.Schema

  import_types(WithElmWeb.Graphql.Post)

  query do
    field :posts, non_null(list_of(non_null(:post))) do
      resolve(fn _, _ ->
        {:ok, WithElm.Content.list_posts()}
      end)
    end
  end
end
