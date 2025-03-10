defmodule ServerPlug do
  use Plug.Builder

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Simple server in Elixir")
  end
end

{:ok, _} = Plug.Cowboy.http(ServerPlug, [])
IO.puts "Server running at http://localhost:8080/"
