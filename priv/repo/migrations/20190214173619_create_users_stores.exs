defmodule Spacestore.Repo.Migrations.CreateUsersStores do
  use Ecto.Migration

  def change do
    create table(:users_stores) do
      add :user_id, references(:users, on_delete: :nothing)
      add :store_id, references(:stores, on_delete: :nothing)

      timestamps()
    end

    create index(:users_stores, [:user_id])
    create index(:users_stores, [:store_id])
  end
end
