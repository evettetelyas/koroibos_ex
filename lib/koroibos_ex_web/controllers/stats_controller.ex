defmodule KoroibosExWeb.StatsController do
	use KoroibosExWeb, :controller
	alias KoroibosEx.Olympians.Olympians

	action_fallback KoroibosEx.FallbackController

	def show(conn, _params) do
		render conn, "stats.json", stat: Olympians.get_stats()
	end

end