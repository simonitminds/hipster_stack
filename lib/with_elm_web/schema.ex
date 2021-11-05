defmodule WithElmWeb.Schema do
  use Absinthe.Schema

  import_types(WithElmWeb.Graphql.Post.Type)
  import_types(WithElmWeb.Graphql.Post.Queries)
  import_types(WithElmWeb.Graphql.Post.Mutations)

  query do
    import_fields(:post_queries)
  end

  mutation do
    import_fields(:post_mutations)
  end
end
