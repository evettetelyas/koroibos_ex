defmodule KoroibosExWeb.OlympiansController do
	use KoroibosExWeb, :controller
	alias KoroibosEx.Olympians.Olympians

	action_fallback KoroibosEx.FallbackController

	def index(conn, params) do
		case params["age"] do
			"youngest" -> render conn, "index.json", olympians: Olympians.get_by_age([asc: :age])
			"oldest" -> render conn, "index.json", olympians: Olympians.get_by_age([desc: :age])
			_ -> render conn, "index.json", olympians: Olympians.all()
		end
	end

	def stats(conn, _params) do
		render conn, "stats.json", stat: Olympians.get_stats()
	end

end