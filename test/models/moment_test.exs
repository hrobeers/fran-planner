defmodule FranAppBackend.MomentTest do
  use FranAppBackend.ModelCase

  alias FranAppBackend.Moment

  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, endtime: %{hour: 14, min: 0}, location: "some content", starttime: %{hour: 14, min: 0}, max_count: 10}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Moment.changeset(%Moment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Moment.changeset(%Moment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
