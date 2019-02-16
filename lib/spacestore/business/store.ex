defmodule Spacestore.Business.Store do
  use Ecto.Schema
  import Ecto.Changeset
  alias Spacestore.Account.User
  alias Spacestore.Business.StoreAddress
  alias Spacestore.Business.UserStore

  schema "stores" do
    field :description, :string
    field :document, :string
    field :email, :string
    field :name, :string
    field :logo, :string, default: "https://static.thenounproject.com/png/340719-200.png"
    belongs_to :owner, User
    many_to_many :sellers, User, join_through: UserStore
    has_one :address, StoreAddress

    timestamps(usec: false)
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:name, :description, :email, :document])
    |> validate_required([:name, :description, :email, :document])
  end
end
