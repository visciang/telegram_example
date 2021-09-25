defmodule TelegramExample.Application do
  use Application

  @impl Application
  def start(_type, _args) do
    token = Application.fetch_env!(:telegram_example, :token_counter_bot)
    options = [purge: true, max_bot_concurrency: 1_000]

    children = [
      {Telegram.Bot.ChatBot.Supervisor, {TelegramExample.Bot.Counter, token, options}}
    ]

    opts = [strategy: :one_for_one, name: TelegramExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
