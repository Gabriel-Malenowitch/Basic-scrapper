import Config

config :basic_scrapper, BasicWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "8Cf+2us9IL7dUJZZwfQe5qGpH8AuMclQXAsY+1Y+Gqw+knlAsYS8lfb2WiQdMKtI"

config :basic_scrapper, BasicWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/basic_scrapper_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :basic_scrapper, dev_routes: true
config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
config :swoosh, :api_client, false
