defmodule Mix.Tasks.Olympians do
	use Mix.Task
  alias KoroibosEx.Repo
  alias KoroibosEx.Olympians.Olympian

	@shortdoc "import olympians from csv to db"

  def run(_) do
		Mix.Task.run("app.start")
		File.stream!("./priv/repo/raw_data/olympic_data_2016.csv")
		|> CSV.decode(headers: true)
		|> Enum.each(fn olympian -> 
			{:ok, data} = olympian
			Olympian.changeset(%Olympian{}, %{
				name: data["Name"],
				sex: data["Sex"],
				age: int_na(data["Age"]),
				height: int_na(data["Height"]),
				weight: int_na(data["Weight"]),
				team: data["Team"],
				games: data["Games"],
				sport: data["Sport"],
				event: data["Event"],
				medal: str_na(data["Medal"]),
			})
			|> Repo.insert
		end)
	end

	defp int_na(phrase) do
		case phrase do
			"NA" -> nil
			_ -> String.to_integer(phrase)
		end
	end

	defp str_na(phrase) do
		case phrase do
			"NA" -> nil
			_ -> phrase
		end
	end
end