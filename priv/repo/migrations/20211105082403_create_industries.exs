defmodule WithElm.Repo.Migrations.CreateIndustries do
  use Ecto.Migration

  def change do
    create table(:industries) do
      add :title, :string
      add :is_automotive, :boolean, default: false, null: false

      timestamps()
    end
  end
end
