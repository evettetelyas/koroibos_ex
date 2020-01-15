defmodule KoroibosEx.Events.Events do
	import Ecto.Query, warn: false

  alias KoroibosEx.Repo
	alias KoroibosEx.Events.Event
	alias KoroibosEx.Olympians.Olympian

	def all_sports do
		query = from e in Event,
						select: e.sport,
						distinct: e.sport

		Repo.all(query)
	end

	def all_events(sport) do
		query = from e in Event,
						select: e.name,
						where: e.sport == ^sport,
						distinct: e.name

		Repo.all(query)
	end

	def get_event(id) do
		query = from e in Event,
						select: e.name,
						where: e.id == ^id

		Repo.all(query)
	end

	def get_medalists(name) do
		query = from o in Olympian,
						# select: [o.name, o.age, o.team, o.medal],
						where: o.event == ^name,
						where: not is_nil(o.medal)

		Repo.all(query)
	end
end