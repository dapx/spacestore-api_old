defmodule Spacestore.BusinessTest do
  use Spacestore.DataCase

  alias Spacestore.Business

  describe "stores" do
    alias Spacestore.Business.Store

    @valid_attrs %{description: "some description", document: "some document", email: "some email", name: "some name"}
    @update_attrs %{description: "some updated description", document: "some updated document", email: "some updated email", name: "some updated name"}
    @invalid_attrs %{description: nil, document: nil, email: nil, name: nil}

    def store_fixture(attrs \\ %{}) do
      {:ok, store} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Business.create_store()

      store
    end

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Business.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Business.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      assert {:ok, %Store{} = store} = Business.create_store(@valid_attrs)
      assert store.description == "some description"
      assert store.document == "some document"
      assert store.email == "some email"
      assert store.name == "some name"
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      assert {:ok, store} = Business.update_store(store, @update_attrs)
      assert %Store{} = store
      assert store.description == "some updated description"
      assert store.document == "some updated document"
      assert store.email == "some updated email"
      assert store.name == "some updated name"
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_store(store, @invalid_attrs)
      assert store == Business.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Business.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Business.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Business.change_store(store)
    end
  end

  describe "users_stores" do
    alias Spacestore.Business.UserStore

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_store_fixture(attrs \\ %{}) do
      store = store_fixture()
      user = Spacestore.AccountTest.user_fixture()
      {:ok, user_store} =
        attrs
        |> Enum.into(%{ store_id: store.id, user_id: user.id })
        |> Business.create_user_store()

      user_store
    end

    test "list_users_stores/0 returns all users_stores" do
      user_store = user_store_fixture()
      assert Business.list_users_stores() == [user_store]
    end

    test "get_user_store!/1 returns the user_store with given id" do
      user_store = user_store_fixture()
      assert Business.get_user_store!(user_store.id) == user_store
    end

    test "create_user_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_user_store(@invalid_attrs)
    end

    test "update_user_store/2 with valid data updates the user_store" do
      user_store = user_store_fixture()
      assert {:ok, user_store} = Business.update_user_store(user_store, @update_attrs)
      assert %UserStore{} = user_store
    end

    test "delete_user_store/1 deletes the user_store" do
      user_store = user_store_fixture()
      assert {:ok, %UserStore{}} = Business.delete_user_store(user_store)
      assert_raise Ecto.NoResultsError, fn -> Business.get_user_store!(user_store.id) end
    end

    test "change_user_store/1 returns a user_store changeset" do
      user_store = user_store_fixture()
      assert %Ecto.Changeset{} = Business.change_user_store(user_store)
    end
  end
end
