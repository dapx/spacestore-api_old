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
  secret_key_base: "4/rX8AG8pSIVuUtnMdZv92OKf+B5mGrkb6Rv28/qrqs0fMwQN2Wy/sAVBBHgZ3NS",
  render_errors: [view: SpacestoreWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Spacestore.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"