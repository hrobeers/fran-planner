defmodule FranAppBackend.Attendance do
  use FranAppBackend.Web, :model

  schema "attendances" do
    belongs_to :moment, Moment

    field :name, :string
    field :count, :integer

    timestamps
  end

  @required_fields ~w(moment_id name count)
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
