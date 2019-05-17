defmodule SpacestoreWeb.Router do
  use SpacestoreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug :api
  end

  scope "/" do
    pipe_through :graphql
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: SpacestoreWeb.Schema,
      interface: :simple,
      context: %{pubsub: SpacestoreWeb.Endpoint}

    forward "/graphql", Absinthe.Plug,
      schema: SpacestoreWeb.Schema,
      context: %{pubsub: SpacestoreWeb.Endpoint}
  end
end
