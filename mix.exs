defmodule TelegramExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :telegram_example,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:telegram, github: "visciang/telegram", tag: "0.22.0"},
      {:hackney, "~> 1.18"}
    ]
  end
end
