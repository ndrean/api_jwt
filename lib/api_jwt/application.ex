defmodule ApiJwt.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ApiJwt.Repo,
      # Start the Telemetry supervisor
      ApiJwtWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ApiJwt.PubSub},
      # Start the Endpoint (http/https)
      ApiJwtWeb.Endpoint
      # Start a worker by calling: ApiJwt.Worker.start_link(arg)
      # {ApiJwt.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApiJwt.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ApiJwtWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
