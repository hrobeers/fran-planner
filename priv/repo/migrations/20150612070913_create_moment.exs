defmodule FranAppBackend.Repo.Migrations.CreateMoment do
  use Ecto.Migration

  def change do
    create table(:moments) do
      add :date, :date
      add :starttime, :time
      add :endtime, :time
      add :location, :string
      add :max_count, :integer

      timestamps
    end

  end
end
