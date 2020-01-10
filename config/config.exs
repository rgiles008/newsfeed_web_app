# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rb_app,
  ecto_repos: [RbApp.Repo]

# Configures the endpoint
config :rb_app, RbAppWeb.Endpoint,        
  # live_view: [signing_salt: "nXhhYArrUcqfQXM0jqal1XOgB9moT00F"],
  url: [host: "localhost"],
  secret_key_base: "3f4WXYQmVPS5/BdWlIqxFRMsSe5gmrholv1Mf+OqUa3DFTusnQEqjA7IZhmHOwPa",
  render_errors: [view: RbAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RbApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
