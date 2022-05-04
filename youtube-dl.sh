#!/bin/bash

# URL="https://www.youtube.com/watch?v=7YdVfZ4Kcw0"
# URL="https://youtu.be/0N-X6vkVug8"

URLs=(
    "https://youtu.be/7YdVfZ4Kcw0",
    "https://youtu.be/0N-X6vkVug8",
    "https://youtu.be/Zo3Ltf7rFkA",
    "https://youtu.be/F3OFIuIXcSo",
    "https://youtu.be/_Kqtj14rxes"
)

ARRAY_SIZE=${#URLs[*]}

alsamixer -D pulse sset Master 50%                  && \ # set the volume 50%
echo "alsamixer setting completed" >> /tmp/cron.log && \ # for debug
date >> /tmp/cron.log                               && \ # for debug
# mpv --no-video --aid=0 $URL                              # Play the $URL
for ((i = 0; i < $ARRAY_SIZE; i++)) {
    RANDOM_INDEX=$(($RANDOM % ${ARRAY_SIZE}))
    # echo ${RANDOM_INDEX} # OK
    URL=${URLs[${RANDOM_INDEX}]}
    echo "Now Playing $URL" >> /tmp/cron.log && \
    mpv --no-video --aid=0 $URL
}