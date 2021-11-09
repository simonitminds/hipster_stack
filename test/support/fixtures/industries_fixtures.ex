defmodule WithElm.IndustriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WithElm.Industries` context.
  """

  @doc """
  Generate a industry.
  """
  def industry_fixture(attrs \\ %{}) do
    {:ok, industry} =
      attrs
      |> Enum.into(%{
        isAutomotive: true,
        title: "some title"
      })
      |> WithElm.Industries.create_industry()

    industry
  end
end
