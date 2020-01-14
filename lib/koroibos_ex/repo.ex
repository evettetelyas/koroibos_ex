defmodule KoroibosEx.Repo do
  use Ecto.Repo,
    otp_app: :koroibos_ex,
    adapter: Ecto.Adapters.Postgres
end
