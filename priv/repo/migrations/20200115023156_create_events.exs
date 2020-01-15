defmodule KoroibosEx.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
		create table(:events) do
      add :name, :string
      add :sport, :string

      timestamps()
    end
  end
end
