import Config

config :logger, :console, metadata: [:bot, :token, :chat_id]
