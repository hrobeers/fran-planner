defmodule FranAppBackend.AttendanceControllerTest do
  use FranAppBackend.ConnCase

  alias FranAppBackend.Attendance
  @valid_attrs %{moment_id: 3, name: "some name", count: 6}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, attendance_path(conn, :index)
    assert json_response(conn, 200)["attendances"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    attendance = Repo.insert %Attendance{moment_id: 5, name: "another name", count: 1}
    conn = get conn, attendance_path(conn, :show, attendance)
    assert json_response(conn, 200)["attendance"] == %{"id" => attendance.id,
      "count" => 1, "moment_id" => 5, "name" => "another name"}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, attendance_path(conn, :create), attendance: @valid_attrs
    assert json_response(conn, 200)["attendance"]["id"]
    assert Repo.get_by(Attendance, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, attendance_path(conn, :create), attendance: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    attendance = Repo.insert %Attendance{}
    conn = put conn, attendance_path(conn, :update, attendance), attendance: @valid_attrs
    assert json_response(conn, 200)["attendance"]["id"]
    assert Repo.get_by(Attendance, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    attendance = Repo.insert %Attendance{}
    conn = put conn, attendance_path(conn, :update, attendance), attendance: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    attendance = Repo.insert %Attendance{}
    conn = delete conn, attendance_path(conn, :delete, attendance)
    assert json_response(conn, 200)["attendance"]["id"]
    refute Repo.get(Attendance, attendance.id)
  end
end
