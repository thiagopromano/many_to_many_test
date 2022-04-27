defmodule ManyToManyTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ManyToManyTest.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ManyToManyTest.PubSub}
      # Start a worker by calling: ManyToManyTest.Worker.start_link(arg)
      # {ManyToManyTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ManyToManyTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
end
