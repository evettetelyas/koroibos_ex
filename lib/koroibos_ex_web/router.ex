defmodule KoroibosExWeb.Router do
  use KoroibosExWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", KoroibosExWeb do
		pipe_through :api
		get "/olympians", OlympiansController, :index
		get "/olympian_stats", StatsController, :show
  end
end
