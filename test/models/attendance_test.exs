defmodule FranAppBackend.AttendanceTest do
  use FranAppBackend.ModelCase

  alias FranAppBackend.Attendance

  @valid_attrs %{moment_id: 3, name: "some name", count: 6}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Attendance.changeset(%Attendance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Attendance.changeset(%Attendance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
