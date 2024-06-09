defmodule BasicWeb.ApiController do
  use BasicWeb, :controller

  def hello_world(conn, _params) do
    json(conn, %{hello: "World!"})
  end
end
