defmodule SpacestoreWeb.Router do
  use SpacestoreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: SpacestoreWeb.Schema,
      interface: :simple,
      context: %{pubsub: SpacestoreWeb.Endpoint}
  end
end
