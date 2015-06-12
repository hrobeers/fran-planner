defmodule FranAppBackend.Repo.Migrations.CreateAttendance do
  use Ecto.Migration

  def change do
    create table(:attendances) do
      add :moment_id, :integer
      add :name, :string
      add :count, :integer

      timestamps
    end

  end
end
