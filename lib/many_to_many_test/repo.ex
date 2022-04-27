defmodule ManyToManyTest.Repo do
  use Ecto.Repo,
    otp_app: :many_to_many_test,
    adapter: Ecto.Adapters.Postgres
end
