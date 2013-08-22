#!/bin/bash
INRES="1920x1080" # input resolution
OUTRES="640x360"
OFFSET="0,0"
FPS="15" # target FPS
QUAL="fast"  # one of the many FFMPEG preset
STREAM_KEY="live_47968513_B78GchkaPUz0g4ipkKuie5Vgvs8iQa"
URL="rtmp://live.justin.tv/app/$STREAM_KEY"
 
avconv -f x11grab -s "$INRES" -r "$FPS" -i :0.0+$OFFSET -ab 192k \
-f alsa -ac 2 -i pulse -vcodec libx264 -crf 30 -preset "$QUAL" -s "1280x720" \
-vol 11200 -acodec libmp3lame -ar 44100 -threads 0 \
-f flv "$URL"
