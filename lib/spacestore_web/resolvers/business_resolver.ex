defmodule SpacestoreWeb.BusinessResolver do
  alias Spacestore.Business

  def create_store(_root, args, _info) do
    # TODO: add detailed error message handling later
    case Business.create_store(args) do
      {:ok, store} ->
        {:ok, store}
      _error ->
        {:error, "could not create store"}
    end
  end

  def all_stores(_root, _args, _info) do
    stores = Business.list_stores_with_owner()
    {:ok, stores}
  end
end