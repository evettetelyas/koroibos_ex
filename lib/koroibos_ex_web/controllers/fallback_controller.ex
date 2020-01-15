defmodule KoroibosEx.FallbackController do
	use Phoenix.Controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(KoroibosExWeb.ErrorView, :"404")
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(403)
    |> render(KoroibosExWeb.ErrorView, :"403")
  end
end