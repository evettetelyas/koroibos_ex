defmodule KoroibosExWeb.StatsController do
	use KoroibosExWeb, :controller
	alias KoroibosEx.Olympians.Stats

	action_fallback KoroibosEx.FallbackController

	def show(conn, _params) do
		render conn, "stats.json", stat: Stats.get_stats()
	end

end