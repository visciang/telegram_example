import Config

config :logger, :console, metadata: [:bot, :token, :chat_id]

config :tesla, adapter: {Tesla.Adapter.Hackney, [recv_timeout: 30_000]}
