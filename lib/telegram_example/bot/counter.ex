defmodule TelegramExample.Bot.Counter do
  @moduledoc false

  use Telegram.ChatBot

  @session_ttl 60 * 1_000

  @impl Telegram.ChatBot
  def init(_chat) do
    count_state = 0
    {:ok, count_state, @session_ttl}
  end

  @impl Telegram.ChatBot
  def handle_update(%{"message" => %{"text" => "/reset", "chat" => %{"id" => chat_id}}}, token, count_state) do
    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      text: "Reset message counter (it was #{count_state})"
    )

    {:ok, 0, @session_ttl}
  end

  def handle_update(%{"message" => %{"text" => "/stop", "chat" => %{"id" => chat_id}}}, token, count_state) do
    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      text: "Counter destroyed, bye!"
    )

    {:stop, count_state}
  end

  def handle_update(%{"message" => %{"chat" => %{"id" => chat_id}}}, token, count_state) do
    count_state = count_state + 1

    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      text: "Hey! You sent me #{count_state} messages"
    )

    {:ok, count_state, @session_ttl}
  end

  def handle_update(_update, _token, count_state) do
    # Unknown update
    {:ok, count_state, @session_ttl}
  end

  @impl Telegram.ChatBot
  def handle_timeout(token, chat_id, count_state) do
    Telegram.Api.request(token, "sendMessage",
      chat_id: chat_id,
      text: "See you!"
    )

    super(token, chat_id, count_state)
  end
end
