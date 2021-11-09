defmodule WithElm.Industries.Industry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "industries" do
    field :is_automotive, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(industry, attrs) do
    industry
    |> cast(attrs, [:title, :is_automotive])
    |> validate_required([:title, :is_automotive])
    |> validate_length(:title, min: 3)
  end
end
