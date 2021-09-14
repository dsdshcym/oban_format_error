defmodule ObanFormatError.Repo do
  use Ecto.Repo,
    otp_app: :oban_format_error,
    adapter: Ecto.Adapters.Postgres
end
