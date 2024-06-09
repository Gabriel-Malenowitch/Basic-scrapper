defmodule BasicScrapper.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DNSCluster, query: Application.get_env(:basic_scrapper, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BasicScrapper.PubSub},
      {Finch, name: BasicScrapper.Finch},
      BasicWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: BasicScrapper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    BasicWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
