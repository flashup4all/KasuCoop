# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :coop,
  ecto_repos: [Coop.Repo]

# Configures the endpoint
config :coop, CoopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pG77wISDrbbMOvlM8qUP+d4JHXmDb2n0ZV1ICrtkHzyNW9DQP6HMZUDvwkekI39R",
  render_errors: [view: CoopWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Coop.PubSub,
  live_view: [signing_salt: "0crA7Lnr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# guardian config
config :coop, Coop.Guardian,
       issuer: "coop",
       secret_key: "${GUARDIAN_SECRET}" #"d40Am5K/zwqndik24ly8JQ2a4iWcRyAZIALJ65uwRAzlL7Kxux6dVMxAlTjrr7jJ"
      #  System.get_env("GUARDIAN_SECRET") # 
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
