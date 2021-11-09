defmodule WithElmWeb.Graphql.Post.Queries do
  use Absinthe.Schema.Notation
  alias WithElm.Content

  object :post_queries do
    @desc "get all posts"
    field :posts, non_null(list_of(non_null(:post))) do
      resolve(fn _, _ ->
        {:ok, Content.list_posts()}
      end)
    end

    field :post, :post do
      arg(:id, non_null(:id))

      resolve(fn %{id: item_id}, _ ->
        {:ok, Content.get_post!(item_id)}
      end)
    end

    field :industries, list_of(non_null(:industry)) do
      resolve(&Resolvers.Industry.list_industries/4)
    end
  end
end
