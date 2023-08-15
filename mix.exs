defmodule TelegramExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :telegram_example,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_local_path: "_build/plts"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {TelegramExample.Application, []}
    ]
  end

  defp deps do
    [
      {:telegram, github: "visciang/telegram", branch: "webserver-adapter"},
      {:bandit, "~> 1.0-pre"},
      {:finch, "~> 0.16.0"},
      {:credo, "~> 1.0", only: [:dev], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false}
    ]
  end
end
