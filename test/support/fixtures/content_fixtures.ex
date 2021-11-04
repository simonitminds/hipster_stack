defmodule WithElm.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WithElm.Content` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        likes: 42,
        title: "some title"
      })
      |> WithElm.Content.create_post()

    post
  end
end
