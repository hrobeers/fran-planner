defmodule FranAppBackend.MomentControllerTest do
  use FranAppBackend.ConnCase

  alias FranAppBackend.Moment
  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, endtime: %{hour: 14, min: 0}, location: "some content", starttime: %{hour: 14, min: 0}, max_count: 10}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, moment_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    moment = Repo.insert %Moment{}
    conn = get conn, moment_path(conn, :show, moment)
    assert json_response(conn, 200)["data"] == %{
      "id" => moment.id
    }
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, moment_path(conn, :create), moment: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Moment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, moment_path(conn, :create), moment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    moment = Repo.insert %Moment{}
    conn = put conn, moment_path(conn, :update, moment), moment: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Moment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    moment = Repo.insert %Moment{}
    conn = put conn, moment_path(conn, :update, moment), moment: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    moment = Repo.insert %Moment{}
    conn = delete conn, moment_path(conn, :delete, moment)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Moment, moment.id)
  end
end
