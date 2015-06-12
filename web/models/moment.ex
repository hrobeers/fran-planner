defmodule FranAppBackend.Moment do
  use FranAppBackend.Web, :model

  schema "moments" do
    has_many :attendances, Attendance

    field :date, Ecto.Date
    field :starttime, Ecto.Time
    field :endtime, Ecto.Time
    field :location, :string
    field :max_count, :integer

    timestamps
  end

  @required_fields ~w(date starttime endtime location max_count)
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
