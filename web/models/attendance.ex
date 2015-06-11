defmodule FranAppBackend.Attendance do
  use FranAppBackend.Web, :model

  schema "attendances" do
    field :name, :string
    field :date, :Ecto.Date
    field :count, :integer

    timestamps
  end

  @required_fields ~w(name date count)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
