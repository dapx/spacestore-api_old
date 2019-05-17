defmodule SpacestoreWeb.Schema.SessionTypes do
  use Absinthe.Schema.Notation

  object :session do
    field :token, non_null(:string)
  end
end