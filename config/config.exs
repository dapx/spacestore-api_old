# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :spacestore,
  ecto_repos: [Spacestore.Repo]

# Configures the endpoint
config :spacestore, SpacestoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY"),
  render_errors: [view: SpacestoreWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Spacestore.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :phoenix, :json_library, Jason

config :spacestore, SpacestoreWeb.Auth.Guardian,
  issuer: "spacestore",
  secret_key: System.get_env("GUARDIAN_SECRET_KEY")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
