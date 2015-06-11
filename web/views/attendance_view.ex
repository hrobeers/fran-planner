defmodule FranAppBackend.AttendanceView do
  use FranAppBackend.Web, :view

  def render("index.json", %{attendances: attendances}) do
    %{data: render_many(attendances, "attendance.json")}
  end

  def render("show.json", %{attendance: attendance}) do
    %{data: render_one(attendance, "attendance.json")}
  end

  def render("attendance.json", %{attendance: attendance}) do
    %{
        id: attendance.id,
        name: attendance.name,
        date: attendance.date,
        count: attendance.count
     }
  end
end
