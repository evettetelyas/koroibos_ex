defmodule KoroibosEx.Olympians.Olympian do
	use Ecto.Schema
	import Ecto.Changeset
	
	schema "olympians" do
		field :name, :string
		field :sex, :string
		field :age, :integer
		field :height, :integer
		field :weight, :integer
		field :team, :string
		field :games, :string
		field :sport, :string
		field :event, :string
		field :medal, :string

		timestamps()
	end
  
	def changeset(struct, params \\ %{}) do
	  struct
	  |> cast(params, [:name, :sex, :age, :height, :weight, :team, :games, :sport, :event, :medal])
	end
end