defmodule KoroibosEx.Events.Event do
	use Ecto.Schema
	import Ecto.Changeset
	
	schema "events" do
		field :name, :string
		field :sport, :string

		timestamps()
	end
  
	def changeset(struct, params \\ %{}) do
	  struct
	  |> cast(params, [:name, :sport])
	end
end