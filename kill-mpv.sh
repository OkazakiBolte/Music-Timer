#!/bin/bash

COMMAND=mpv

# This shellscript finds a process ID of $COMMAND and kills it.

ps aux | grep $COMMAND | grep -v grep | awk '{ print "kill -9", $2 }' | sh