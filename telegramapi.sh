#!/usr/bin/bash

TELEGRAM_BOT_TOKEN=''
DST=$1
SBJ=$(echo $2 | sed "s/ /%20/g")
MSG=$(echo $3 | sed "s/ /%20/g")

TXT=$(echo $SBJ"%0A"$MSG)

curl -s \
	-X POST \
	https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage \
	-d chat_id=$DST \
	-d text=$TXT \
	| jq .
