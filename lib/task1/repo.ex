defmodule Task1.Repo do
  use Ecto.Repo,
    otp_app: :task1,
    adapter: Ecto.Adapters.Postgres
end
