#!/bin/bash

source /home/okazaki/my_palace/bgm/URLs.sh
# URLs=(
#     "https://youtu.be/7YdVfZ4Kcw0",
#     "https://youtu.be/0N-X6vkVug8",
#     "https://youtu.be/Zo3Ltf7rFkA",
#     "https://youtu.be/F3OFIuIXcSo",
#     "https://youtu.be/_Kqtj14rxes",
#     "https://youtu.be/fsHCWE4y-uI",
#     "https://youtu.be/k1OcBxp7DKA",
#     "https://youtu.be/2_aRBPJekjw",
#     "https://youtu.be/G1B4hAr3Ark"
# )

#  # short videos for test
# URLs=(
#     "https://youtu.be/gZ_TL5TSdH4",
#     "https://youtu.be/mtsOnDTSWaA",
#     "https://youtu.be/U5Z76XLEwRM",
#     "https://youtu.be/ECwN4nSCVDk"
# )
ARRAY_SIZE=${#URLs[*]}
LOG_FILE="/home/okazaki/my_palace/bgm/play.log"

alsamixer -D pulse sset Master 45% && \
date >> $LOG_FILE                  && \
for ((i = 0; i < $ARRAY_SIZE; i++)) {
    RANDOM_INDEX=$(($RANDOM % ${ARRAY_SIZE}))
    URL=${URLs[${RANDOM_INDEX}]}
    echo "Now Playing $URL" >> $LOG_FILE && \
    mpv --no-video --aid=0 $URL 2> /dev/null
}
