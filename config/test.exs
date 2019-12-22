use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rb_app, RbAppWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rb_app, RbApp.Repo,
  username: "postgres",
  password: "postgres",
  database: "rb_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
