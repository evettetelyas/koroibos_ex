defmodule KoroibosEx.Olympians.Stats do
	import Ecto.Query, warn: false

  alias KoroibosEx.Repo
	alias KoroibosEx.Olympians.Olympian
	alias KoroibosEx.Olympians.Stat

	def get_stats() do
		%Stat{}
		|> num_olympians
		|> avg_age
		|> avg_f_weight
		|> avg_m_weight
	end

	def num_olympians(_stat) do
		query = from o in Olympian,
						select: count()

		[num] = Repo.all(query)
		%Stat{total_competing: num}
	end

	def avg_age(stat) do

		num = Repo.aggregate(Olympian, :avg, :age)
		%Stat{stat | average_age: num}
	end

	def avg_f_weight(stat) do
		query = from o in Olympian,
						where: o.sex == "F"

		num = Repo.aggregate(query, :avg, :weight)
		%Stat{stat | average_female_weight: num}
	end

	def avg_m_weight(stat) do
		query = from o in Olympian,
						where: o.sex == "M"

		num = Repo.aggregate(query, :avg, :weight)
		%Stat{stat | average_male_weight: num}
	end
end