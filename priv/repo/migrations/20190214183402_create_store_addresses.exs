defmodule Spacestore.Repo.Migrations.CreateStoreAddresses do
  use Ecto.Migration

  def change do
    create table(:store_addresses) do
      add :cep, :integer
      add :uf, :string
      add :city, :string
      add :neighborhood, :string
      add :street, :string
      add :number, :integer
      add :complement, :string
      add :latitude, :float
      add :longitude, :float
      add :store_id, references(:stores, on_delete: :nothing)

      timestamps()
    end

    create index(:store_addresses, [:store_id])
  end
end
