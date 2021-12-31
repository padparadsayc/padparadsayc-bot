#!/bin/sh
# Test for curl telegram bot
# Reference: https://gist.github.com/dideler/85de4d64f66c1966788c1b2304b9caf1

if [ -f ./.config ]; then
    . ./.config
fi

main(){
    case "$1" in
        "start")
            python3 ./bot.py "$TELEGRAM_BOT_TOKEN" 
            return
            ;;
        "schedule")
            text="我是每晚定时发送的消息的机器人，现在应该是北京时间晚上 8:00 ，我是否准时了呢？ :)"
            ;;
        "push")
            text="刚 push 了一个新版本呢"
            ;;
        *)  
            echo "Usage: $0 {start|schedule|push}"
            return
            ;;
    esac

    curl -X POST \
        -H 'Content-Type: application/json' \
        -d "{\"chat_id\": \"$TELEGRAM_CHAT_ID\", \"text\": \"${text}\", \"disable_notification\": true}" \
        https://api.telegram.org/bot"$TELEGRAM_BOT_TOKEN"/sendMessage
}

main "$@"
