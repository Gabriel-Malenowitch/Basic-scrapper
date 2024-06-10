defmodule BasicWeb.ApiController do
  use BasicWeb, :controller
  alias BasicScrapper.NewsScrapper

  def hello_world(conn, _params) do
    json(conn, %{hello: "World!"})
  end

  def list_news(conn, _params) do
    news_list = NewsScrapper.get_list()

    json(conn, news_list)
  end
end
