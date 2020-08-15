defmodule Coop.Repo do
  use Ecto.Repo,
    otp_app: :coop,
    adapter: Ecto.Adapters.Postgres
end
