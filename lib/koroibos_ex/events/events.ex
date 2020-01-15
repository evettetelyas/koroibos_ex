defmodule KoroibosEx.Events.Events do
	import Ecto.Query, warn: false

  alias KoroibosEx.Repo
	alias KoroibosEx.Events.Event

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
end