defmodule BasicWeb.Router do
  use BasicWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :put_root_layout, html: {BasicWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BasicWeb do
    pipe_through :api

    get "/", ApiController, :hello_world
  end
end
