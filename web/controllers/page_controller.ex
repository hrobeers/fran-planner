defmodule FranAppBackend.PageController do
  use FranAppBackend.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
