defmodule SpacestoreWeb.Schema.StoreTypes do
  use Absinthe.Schema.Notation

  object :owner do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  object :store do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :logo, non_null(:string)
    field :description, non_null(:string)
    field :email, non_null(:string)
    field :owner, non_null(:owner)
    field :address, non_null(:address)
  end
end