defmodule Spacestore.Account.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :is_verified, :boolean, default: false
    field :name, :string
    field :password, :string

    timestamps(usec: false)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :is_verified])
    |> validate_required([:name, :email, :password, :is_verified])
  end
end
