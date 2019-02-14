defmodule SpacestoreWeb.Schema do
  use Absinthe.Schema

  alias SpacestoreWeb.BusinessResolver

  object :owner do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  object :store do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :owner, non_null(:owner)
  end

  query do
    field :all_stores, non_null(list_of(non_null(:store))) do
      resolve &BusinessResolver.all_stores/3
    end
  end
end