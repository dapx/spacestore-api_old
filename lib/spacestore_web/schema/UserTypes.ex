defmodule SpacestoreWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

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

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :is_verified, non_null(:boolean)
  end
end