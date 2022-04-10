defmodule TelegramExample.Application do
  use Application

  @impl Application
  def start(_type, _args) do
    token = Application.fetch_env!(:telegram_example, :token_counter_bot)
    max_bot_concurrency = Application.fetch_env!(:telegram_example, :max_bot_concurrency)
    options = [token: token, max_bot_concurrency: max_bot_concurrency]

    children = [
      {TelegramExample.Bot.Counter, options}
    ]

    opts = [strategy: :one_for_one, name: TelegramExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
