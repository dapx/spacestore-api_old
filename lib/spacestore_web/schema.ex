defmodule SpacestoreWeb.Schema do
  use Absinthe.Schema

  alias SpacestoreWeb.BusinessResolver

  object :address do
    field :id, non_null(:id)
    field :cep, non_null(:integer)
    field :uf, non_null(:string)
    field :city, non_null(:string)
    field :neighborhood, non_null(:string)
    field :street, non_null(:string)
    field :number, non_null(:integer)
    field :complement, non_null(:string)
    field :latitude, non_null(:float)
    field :longitude, non_null(:float)
  end

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
    field :address, non_null(:address)
  end

  query do
    field :all_stores, non_null(list_of(non_null(:store))) do
      resolve &BusinessResolver.all_stores/3
    end
  end
end