defmodule Worker do
  use Oban.Worker, max_attempts: 2

  def reproduce() do
    job =
      %{}
      |> new()
      |> Oban.insert!()

    Oban.Registry.via(Oban, {:producer, "default"})
    |> GenServer.whereis()
    |> Process.exit(:error)

    job
  end

  def perform(%{attempt: 1}) do
    Process.sleep(:timer.seconds(60))
    raise("attempt 1 failed")
  end

  def perform(%{attempt: 2}) do
    raise("attempt 2 failed")
  end
end
