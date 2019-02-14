defmodule Spacestore.Business.UserStore do
  use Ecto.Schema
  import Ecto.Changeset
  alias Spacestore.Account.User
  alias Spacestore.Business.Store


  schema "users_stores" do
    belongs_to :user, User
    belongs_to :store, Store


    timestamps(usec: false)
  end

  @doc false
  def changeset(user_store, attrs) do
    user_store
    |> cast(attrs, [:user_id, :store_id])
    |> validate_required([:user_id, :store_id])
  end
end
