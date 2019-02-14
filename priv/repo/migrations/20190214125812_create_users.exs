defmodule Spacestore.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :is_verified, :boolean, default: false, null: false

      timestamps()
    end

  end
end
