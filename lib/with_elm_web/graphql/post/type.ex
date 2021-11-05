defmodule WithElmWeb.Graphql.Post.Type do
  use Absinthe.Schema.Notation

  @desc "A post"
  object :post do
    @desc "The title"
    field :title, non_null(:string)

    field :content, non_null(:string)

    field :likes, :integer
    field :id, :id
  end
end
