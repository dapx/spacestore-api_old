defmodule Spacestore.Repo.Migrations.AddStoreLogoField do
  use Ecto.Migration

  def change do
    alter table(:stores) do
      add :logo, :string
    end
  end
end
