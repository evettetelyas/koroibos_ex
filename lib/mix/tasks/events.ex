defmodule Mix.Tasks.Events do
	use Mix.Task
  alias KoroibosEx.Repo
  alias KoroibosEx.Events.Event
  alias KoroibosEx.Olympians.Olympians

	@shortdoc "import events to db"

  def run(_) do
		Mix.Task.run("app.start")
		Olympians.get_events
		|> Enum.each(fn event -> 
			Event.changeset(%Event{}, %{
				name: Enum.at(event, 0),
				sport: Enum.at(event, 1)
			})
			|> Repo.insert
		end)
	end
end