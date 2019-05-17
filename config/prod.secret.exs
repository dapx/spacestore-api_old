use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :spacestore, SpacestoreWeb.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY")

# Configure your database
config :spacestore, Spacestore.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: System.get_env("DB_USER"),
  password: System.get_env("DB_PASS"),
  database: System.get_env("DB_NAME"),
  hostname: System.get_env("DB_HOSTNAME"),
  pool_size: 9
