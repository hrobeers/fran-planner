defmodule FranAppBackend.PageControllerTest do
  use FranAppBackend.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Fran Planner"
  end
end
