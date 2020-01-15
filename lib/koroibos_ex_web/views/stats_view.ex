defmodule KoroibosExWeb.StatsView do
	use KoroibosExWeb, :view
	alias KoroibosEx.Olympians.Olympians
	
	def render("show.json", %{stat: stat}) do
    %{data: render_one(stat, KoroibosExWeb.OlympiansView, "stats.json", as: :stat)}
  end
	
	def render("stats.json", %{stat: stat}) do
		%{
			olympian_stats: %{
					total_competing_olympians: stat.total_competing,
					average_weight: %{
							unit: "kg",
							male_olympians: stat.average_male_weight,
							female_olympians: stat.average_female_weight
					},
					average_age: stat.average_age
				}
			}
	end
end