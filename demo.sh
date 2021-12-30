#!/bin/sh
# Test for curl telegram bot
# Reference: https://gist.github.com/dideler/85de4d64f66c1966788c1b2304b9caf1

if [ -f ./.config ]; then
    . ./.config
fi

curl -X POST \
     -H 'Content-Type: application/json' \
     -d "{\"chat_id\": \"$TELEGRAM_CHAT_ID\", \"text\": \"This is a test from curl. $(date)\", \"disable_notification\": true}" \
     https://api.telegram.org/bot"$TELEGRAM_BOT_TOKEN"/sendMessage
