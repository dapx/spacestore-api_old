defmodule SpacestoreWeb.Schema do
  use Absinthe.Schema

  import_types __MODULE__.UserTypes
  import_types __MODULE__.StoreTypes
  import_types __MODULE__.SessionTypes

  alias SpacestoreWeb.BusinessResolver
  alias SpacestoreWeb.AccountsResolver

  query do
    field :stores, non_null(list_of(non_null(:store))) do
      arg :latitude, non_null(:float)
      arg :longitude, non_null(:float)
      arg :distance, :float, default_value: 10
      resolve &BusinessResolver.stores_by_distance/3
    end

    field :all_stores, non_null(list_of(non_null(:store))) do
      resolve &BusinessResolver.all_stores/3
    end
  end

  mutation do
    field :create_user, type: :user do
      arg :name, non_null(:string)
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &AccountsResolver.create_user/2
    end

    field :login, type: :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
    
      resolve &AccountsResolver.login/2
    end

    field :test, type: :user do
      resolve &AccountsResolver.test/2
    end
  end
end