use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :fran_app_backend, FranAppBackend.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false

# Watch static and templates for browser reloading.
config :fran_app_backend, FranAppBackend.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(html|js|css|png|jpeg|jpg|gif|mustache)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Configure your database
config :fran_app_backend, FranAppBackend.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "fran_app_backend_dev",
  size: 10 # The amount of database connections in the pool
