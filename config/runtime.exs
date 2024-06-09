import Config

if System.get_env("PHX_SERVER") do
  config :basic_scrapper, BasicWeb.Endpoint, server: true
end

if config_env() == :prod do
  config :basic_scrapper, BasicScrapper.Repo,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
    socket_options: []

  host = System.get_env("PHX_HOST") || "example.com"
  port = String.to_integer(System.get_env("PORT") || "4000")

  config :basic_scrapper, :dns_cluster_query, System.get_env("DNS_CLUSTER_QUERY")

  config :basic_scrapper, BasicWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: port
    ]
    # secret_key_base: secret_key_base
end
