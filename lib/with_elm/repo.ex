defmodule WithElm.Repo do
  use Ecto.Repo,
    otp_app: :with_elm,
    adapter: Ecto.Adapters.Postgres
end
