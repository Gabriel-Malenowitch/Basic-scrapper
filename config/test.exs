import Config

config :basic_scrapper, BasicWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "bCaETK1gOYaAAZ7IsfZ4f/NQqPCu+FeJQ8yUHdXLhhVyVmIn4c0h16NRKrGx4PVo",
  server: false

config :swoosh, :api_client, false

config :logger, level: :warning

config :phoenix, :plug_init_mode, :runtime
