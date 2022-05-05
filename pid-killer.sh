#!/bin/bash

COMMAND=mpv

# This shellscript finds a process ID of $COMMAND and kills it.

# source URLs.sh
# ARRAY_SIZE=${#URLs[*]}

# for ((i = 0; i < $ARRAY_SIZE; i++)) {
#     ps aux | grep $COMMAND | grep -v grep | awk '{ print "kill -9", $2 }' | sh
#     sleep 1
# }
ps aux | grep $COMMAND | grep -v grep | awk '{ print "kill -9", $2 }' | sh