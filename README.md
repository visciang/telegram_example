# Telegram ChatBot example

A simple chat_bot application based on https://github.com/visciang/telegram.

```
mix deps.get
MIX_ENV=prod mix release

TOKEN_COUNTER_BOT="..." _build/prod/rel/telegram_example/bin/telegram_example start
```