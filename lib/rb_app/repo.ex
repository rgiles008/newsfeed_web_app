defmodule RbApp.Repo do
  use Ecto.Repo,
    otp_app: :rb_app,
    adapter: Ecto.Adapters.Postgres
end
