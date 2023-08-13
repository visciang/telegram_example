defmodule TelegramExample.Finch do
  @moduledoc false
  use Tesla

  adapter(Tesla.Adapter.Finch, name: __MODULE__, receive_timeout: 40_000)
end
