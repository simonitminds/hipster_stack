defmodule WithElm.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :string
      add :likes, :integer

      timestamps()
    end
  end
end
