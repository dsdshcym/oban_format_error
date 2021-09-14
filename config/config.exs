# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :oban_format_error,
  ecto_repos: [ObanFormatError.Repo]

# Configures the endpoint
config :oban_format_error, ObanFormatErrorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MH2DxhiDsyoQ13IZQJkTu50cRKBNSRUFW6upnifCkr39yUeZ7RdB4LDbvM92LWX4",
  render_errors: [view: ObanFormatErrorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ObanFormatError.PubSub,
  live_view: [signing_salt: "xa/OcXkB"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :oban_format_error, ObanFormatError.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :oban_format_error, Oban,
  engine: Oban.Pro.Queue.SmartEngine,
  repo: ObanFormatError.Repo,
  plugins: [
    {Oban.Pro.Plugins.Lifeline, retry_exhausted: true, rescue_interval: :timer.seconds(10)}
  ],
  queues: [default: 10]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
