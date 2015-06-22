defmodule FranAppBackend.PageController do
  use FranAppBackend.Web, :controller

  plug :action

  def index(conn, _params) do
    conn |> put_resp_content_type("text/html")
         |> send_file(200, Application.app_dir(:fran_app_backend, "priv/static/index.html"))
  end
end
