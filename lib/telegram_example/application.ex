defmodule TelegramExample.Application do
  use Application

  @impl Application
  def start(_type, _args) do
    webhook_config = [
      host: Application.fetch_env!(:telegram_example, :host),
      local_port: Application.fetch_env!(:telegram_example, :local_port)
    ]

    bot_config = [
      token: Application.fetch_env!(:telegram_example, :token_counter_bot),
      max_bot_concurrency: Application.fetch_env!(:telegram_example, :max_bot_concurrency)
    ]

    children = [
      {Telegram.Webhook, config: webhook_config, bots: [{TelegramExample.Bot.Counter, bot_config}]}
    ]

    opts = [strategy: :one_for_one, name: TelegramExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
