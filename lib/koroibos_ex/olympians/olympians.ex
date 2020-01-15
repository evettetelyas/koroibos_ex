defmodule KoroibosEx.Olympians.Olympians do
	import Ecto.Query, warn: false

  alias KoroibosEx.Repo
	alias KoroibosEx.Olympians.Olympian
	
	def all do
		Repo.all(Olympian)
	end

	def get_by_age(type) do
		query = from o in Olympian,
						order_by: ^type,
						limit: 1
		
		Repo.all(query)
	end

	def total_medals(olympian) do
		query = from o in Olympian,
						select: count(),
						where: o.name == ^olympian.name,
						where: not is_nil(o.medal)

		[num] = Repo.all(query)
		num
	end
end