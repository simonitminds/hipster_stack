defmodule Resolvers.Industry do
  @spec list_industries(any, %{id: String.t()}, any, any) :: {:ok, any}
  def list_industries(_, _, _, _) do
    {:ok, WithElm.Industries.list_industries()}
  end
end
