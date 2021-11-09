defmodule WithElmWeb.Graphql.Post.Mutations do
  use Absinthe.Schema.Notation
  alias WithElm.Content
  alias WithElm.Industries

  @desc "The muts"
  object :post_mutations do
    field :post_create, :post do
      arg(:content, non_null(:string))
      arg(:title, non_null(:string))
      arg(:likes, non_null(:integer))

      resolve(fn data, _ ->
        Content.create_post(data)
      end)
    end

    field :post_update, :post do
      arg(:content, :string)
      arg(:title, :string)
      arg(:likes, :integer)
      arg(:id, non_null(:id))

      resolve(fn data, _ ->
        Content.get_post!(data.id)
        |> Content.update_post(data)
      end)
    end

    field :post_delete, :post do
      arg(:id, non_null(:id))

      resolve(fn data, _ ->
        post = Content.get_post(data.id)
        delete_post(post)
      end)
    end

    field :industry_create, :industry do
      arg(:title, non_null(:string))
      arg(:is_automotive, non_null(:boolean))

      resolve(fn data, _ ->
        Industries.create_industry(data)
      end)
    end
  end

  defp delete_post(nil) do
    {:error, :no_post_match}
  end

  defp delete_post(%Content.Post{} = post) do
    Content.delete_post(post)
    {:ok, post}
  end
end
