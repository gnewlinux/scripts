#!/usr/bin/bash

###############################################################
# Author: Tulio Amancio (tsuriu)
# email:  tulioromeror@gmail.com
#
#
# TELEGRAM_BOT_TOKEN: Is the BOTKEY obtained with BOT creation
# DST: Is the destination id, user or group
# SBJ and MSG: Are subject and mensage body respectively
#
###############################################################

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
