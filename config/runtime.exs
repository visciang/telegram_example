import Config

config :telegram_example,
  token_counter_bot: System.fetch_env!("TOKEN_COUNTER_BOT"),
  max_bot_concurrency: 1_000
