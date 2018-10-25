# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :threestars,
  ecto_repos: [Threestars.Repo]

# Configures the endpoint
config :threestars, ThreestarsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O8oq4I5WNYp8nnPe9WvXaXvfBoJpW8pD6fAbi/hQi3Wc8KCFnGn+ON8YMBUylhZK",
  render_errors: [view: ThreestarsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Threestars.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
