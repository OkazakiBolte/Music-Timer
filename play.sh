#!/bin/bash

source /home/okazaki/my_palace/bgm/URLs.sh
# source /home/okazaki/my_palace/bgm/Japanese-lofi.sh

ARRAY_SIZE=${#URLs[*]}
LOG_FILE="/home/okazaki/my_palace/bgm/play.log"

alsamixer -D pulse sset Master 44% && \
date >> $LOG_FILE                  && \
for ((i = 0; i < $ARRAY_SIZE; i++)) {
    RANDOM_INDEX=$(($RANDOM % ${ARRAY_SIZE}))
    URL=${URLs[${RANDOM_INDEX}]}
    echo "Now Playing $URL" >> $LOG_FILE && \
    mpv --no-video --aid=0 $URL 2> /dev/null
}
