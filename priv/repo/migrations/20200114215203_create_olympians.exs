defmodule KoroibosEx.Repo.Migrations.CreateOlympians do
  use Ecto.Migration

  def change do
		create table(:olympians) do
      add :name, :string
      add :sex, :string
      add :age, :integer
      add :height, :integer
      add :weight, :integer
      add :team, :string
      add :games, :string
      add :sport, :string
      add :event, :string
      add :medal, :string

      timestamps()
    end
  end
end
