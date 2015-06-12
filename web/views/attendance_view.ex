defmodule FranAppBackend.AttendanceView do
  use FranAppBackend.Web, :view

  def render("index.json", %{attendances: attendances}) do
    %{attendances: render_many(attendances, "attendance.json")}
  end

  def render("show.json", %{attendance: attendance}) do
    %{attendance: render_one(attendance, "attendance.json")}
  end

  def render("attendance.json", %{attendance: attendance}) do
    %{
        id: attendance.id,
        name: attendance.name,
        moment_id: attendance.moment_id,
        count: attendance.count
     }
  end
end
