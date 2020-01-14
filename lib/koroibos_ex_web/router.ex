defmodule KoroibosExWeb.Router do
  use KoroibosExWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KoroibosExWeb do
    pipe_through :api
  end
end
