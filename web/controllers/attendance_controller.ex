defmodule FranAppBackend.AttendanceController do
  use FranAppBackend.Web, :controller

  alias FranAppBackend.Attendance

  plug :scrub_params, "attendance" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    attendances = Repo.all(Attendance)
    render(conn, "index.json", attendances: attendances)
  end

  def create(conn, %{"attendance" => attendance_params}) do
    changeset = Attendance.changeset(%Attendance{}, attendance_params)

    if changeset.valid? do
      attendance = Repo.insert(changeset)
      render(conn, "show.json", attendance: attendance)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(FranAppBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    attendance = Repo.get(Attendance, id)
    render conn, "show.json", attendance: attendance
  end

  def update(conn, %{"id" => id, "attendance" => attendance_params}) do
    attendance = Repo.get(Attendance, id)
    changeset = Attendance.changeset(attendance, attendance_params)

    if changeset.valid? do
      attendance = Repo.update(changeset)
      render(conn, "show.json", attendance: attendance)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(FranAppBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    attendance = Repo.get(Attendance, id)

    attendance = Repo.delete(attendance)
    render(conn, "show.json", attendance: attendance)
  end
end
