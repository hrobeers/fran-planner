defmodule FranAppBackend.Repo.Migrations.CreateAttendance do
  use Ecto.Migration

  def change do
    create table(:attendances) do
      add :name, :string
      add :date, :date
      add :count, :integer

      timestamps
    end

  end
end
