defmodule MyApp do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "simple server in elixir")
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end

Plug.Adapters.Cowboy2.http MyApp, []
