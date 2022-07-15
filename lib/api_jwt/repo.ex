defmodule ApiJwt.Repo do
  use Ecto.Repo,
    otp_app: :api_jwt,
    adapter: Ecto.Adapters.Postgres
end
