defmodule KoroibosExWeb.EventsController do
	use KoroibosExWeb, :controller
	alias KoroibosEx.Events.Events

	action_fallback KoroibosEx.FallbackController

	def index(conn, _params) do
		render conn, "index.json", events: Events.all_sports()
	end

end