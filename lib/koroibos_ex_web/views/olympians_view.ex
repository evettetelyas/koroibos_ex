defmodule KoroibosExWeb.OlympiansView do
	use KoroibosExWeb, :view
	alias KoroibosEx.Olympians.Olympians
  
	def render("index.json", %{olympians: olympians}) do
    %{data: render_many(olympians, KoroibosExWeb.OlympiansView, "olympian.json", as: :olympian)}
  end

  def render("olympian.json", %{olympian: olympian}) do
    %{
      name: olympian.name,
      team: olympian.team,
      age: olympian.age,
      sport: olympian.sport,
      total_medals_won: Olympians.total_medals(olympian)
      }
  end
end