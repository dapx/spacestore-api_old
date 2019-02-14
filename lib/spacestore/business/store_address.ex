defmodule Spacestore.Business.StoreAddress do
  use Ecto.Schema
  import Ecto.Changeset


  schema "store_addresses" do
    field :cep, :integer
    field :uf, :string
    field :city, :string
    field :neighborhood, :string
    field :street, :string
    field :number, :integer
    field :complement, :string
    field :latitude, :float
    field :longitude, :float
    field :store_id, :id

    timestamps(usec: false)
  end

  @doc false
  def changeset(store_address, attrs) do
    store_address
    |> cast(attrs, [:cep, :neighborhood, :city, :street, :uf, :number, :complement, :latitude, :longitude])
    |> validate_required([:cep, :neighborhood, :city, :street, :uf, :number, :complement, :latitude, :longitude])
  end
end
