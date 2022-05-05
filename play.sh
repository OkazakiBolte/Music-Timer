#!/bin/bash

# source ./URLs.sh
URLs=(
    "https://youtu.be/7YdVfZ4Kcw0",
    "https://youtu.be/0N-X6vkVug8",
    "https://youtu.be/Zo3Ltf7rFkA",
    "https://youtu.be/F3OFIuIXcSo",
    "https://youtu.be/_Kqtj14rxes",
    "https://youtu.be/fsHCWE4y-uI",
    "https://youtu.be/k1OcBxp7DKA",
    "https://youtu.be/2_aRBPJekjw",
    "https://youtu.be/G1B4hAr3Ark"
)

#  # short videos for test
# URLs=(
#     "https://youtu.be/gZ_TL5TSdH4",
#     "https://youtu.be/mtsOnDTSWaA",
#     "https://youtu.be/U5Z76XLEwRM",
#     "https://youtu.be/ECwN4nSCVDk"
# )
ARRAY_SIZE=${#URLs[*]}

alsamixer -D pulse sset Master 45%                  && \
echo "alsamixer setting completed" >> /tmp/cron.log && \
date >> /tmp/cron.log                               && \
# mpv --no-video --aid=0 $URL
for ((i = 0; i < $ARRAY_SIZE; i++)) {
    RANDOM_INDEX=$(($RANDOM % ${ARRAY_SIZE}))
    # echo ${RANDOM_INDEX} # OK
    URL=${URLs[${RANDOM_INDEX}]}
    echo "Now Playing $URL" >> /tmp/cron.log && \
    mpv --no-video --aid=0 $URL
}
