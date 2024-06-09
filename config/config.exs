import Config

config :basic_scrapper,
  generators: [timestamp_type: :utc_datetime]


config :basic_scrapper, BasicWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: BasicWeb.ErrorHTML, json: BasicWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: BasicScrapper.PubSub,
  live_view: [signing_salt: "WShTuh9Z"]



config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :esbuild, :version, "0.17.11"

import_config "#{config_env()}.exs"
