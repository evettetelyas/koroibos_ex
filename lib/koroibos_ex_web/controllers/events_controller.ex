defmodule KoroibosExWeb.EventsController do
	use KoroibosExWeb, :controller
	alias KoroibosEx.Events.Events

	action_fallback KoroibosEx.FallbackController

	def index(conn, _params) do
		render conn, "index.json", events: Events.all_sports()
	end

	def show(conn, params) do
		render conn, "show.json", event: Events.get_event(params["id"])
	end

end