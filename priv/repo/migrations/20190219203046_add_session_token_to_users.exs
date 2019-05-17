defmodule Spacestore.Repo.Migrations.AddSessionTokenToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :token, :text
    end
  end
end
