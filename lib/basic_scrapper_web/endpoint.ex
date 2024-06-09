defmodule BasicWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :basic_scrapper

  plug Plug.Static,
    at: "/",
    from: :basic_scrapper,
    gzip: false,
    only: BasicWeb.static_paths()

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug BasicWeb.Router
end
