defmodule KoroibosEx.Factory do
	use ExMachina.Ecto, repo: KoroibosEx.Repo
  
	def olympian_factory do
	  %KoroibosEx.Olympians.Olympian{
			name: sequence("evette"),
			sex: "F",
			age: 30,
			height: 100,
			weight: 100,
			team: "USA"
			games: "2020"
			sport: "Beatboxing"
			event: "Untz Untz"
			medal: sequence(:medal, [nil, "Gold", "Bronze", "Silver"])
	  }
	end

	def event_factory do
		%KoroibosEx.Events.Event{
			name: "Untz Untz",
			sport: "Beatboxing"
		}
	  end
  end