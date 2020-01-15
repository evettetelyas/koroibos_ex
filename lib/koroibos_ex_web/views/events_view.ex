defmodule KoroibosExWeb.EventsView do
	use KoroibosExWeb, :view
	alias KoroibosEx.Events.Events
	
	def render("index.json", %{events: events}) do
    %{data: render_many(events, KoroibosExWeb.EventsView, "event.json", as: :event)}
	end
	
	def render("show.json", %{event: event}) do
    %{data: render_one(event, KoroibosExWeb.EventsView, "event.json", as: :event)}
	end
	
	def render("event.json", %{event: [event]}) do
		%{
			event: event,
			medalists: Enum.map(Events.get_medalists(event), fn olympian -> 
				%{
					name: olympian.name,
					age: olympian.age,
					team: olympian.team,
					medal: olympian.medal
				}
			end)
		}
	end
end