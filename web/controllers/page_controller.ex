defmodule FranAppBackend.PageController do
  use FranAppBackend.Web, :controller

  plug :action

  def index(conn, _params) do
    conn |> send_file(200, "priv/static/index.html")
  end
end
