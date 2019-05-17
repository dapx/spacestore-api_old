defmodule Spacestore.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Spacestore.Business.Store

  schema "users" do
    field :email, :string
    field :is_verified, :boolean, default: false
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :token, :string

    has_many :own_stores, Store
    many_to_many :stores, Store, join_through: UserStore

    timestamps(usec: false)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :is_verified])
    |> validate_required([:name, :email, :password, :is_verified])
    |> validate_length(:password, min: 5, max: 20)
    |> unique_constraint(:email, downcase: true)
    |> put_password_hash
  end

  def token_changeset(user, attrs) do
    user
    |> cast(attrs, [:token])
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Argon2.hash_pwd_salt(pass))
      _ ->
        changeset
    end
  end
end
