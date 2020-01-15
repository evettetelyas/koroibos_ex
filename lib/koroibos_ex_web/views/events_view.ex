defmodule KoroibosExWeb.EventsView do
	use KoroibosExWeb, :view
	alias KoroibosEx.Events.Events
	
	def render("index.json", %{events: events}) do
    %{data: render_many(events, KoroibosExWeb.EventsView, "event.json", as: :event)}
  end
	
	def render("event.json", %{event: event}) do
		%{
				sport: event,
				events: Events.all_events(event)
			}
	end
end