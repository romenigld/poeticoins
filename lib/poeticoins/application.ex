defmodule Poeticoins.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PoeticoinsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Poeticoins.PubSub},

      {Poeticoins.Historical, name: Poeticoins.Historical},
      {Poeticoins.Exchanges.Supervisor, name: Poeticoins.Exchanges.Supervisor},

      # Start the Endpoint (http/https)
      PoeticoinsWeb.Endpoint
      # Start a worker by calling: Poeticoins.Worker.start_link(arg)
      # {Poeticoins.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Poeticoins.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PoeticoinsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
