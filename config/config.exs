# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :koroibos_ex,
  ecto_repos: [KoroibosEx.Repo]

# Configures the endpoint
config :koroibos_ex, KoroibosExWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "z0Q4Go+7AweLt8XlLDzDSCpiguVXDndOL9zikwRf1paWjvK2nTsHciznl3G+TJAY",
  render_errors: [view: KoroibosExWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: KoroibosEx.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
