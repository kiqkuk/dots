#!/bin/sh

MESSAGE=$1
DURATION=${2:-5}

echo " [ $MESSAGE ] " > /tmp/notify
touch /tmp/notify_time

pkill -RTMIN+13 someblocks
pkill -RTMIN+1 someblocks
pkill -RTMIN+14 someblocks
pkill -RTMIN+15 someblocks
pkill -RTMIN+11 someblocks
pkill -RTMIN+10 someblocks
pkill -RTMIN+2 someblocks

sleep "$DURATION"
echo "" > /tmp/notify
rm /tmp/notify_time

pkill -RTMIN+13 someblocks
pkill -RTMIN+1 someblocks
pkill -RTMIN+14 someblocks
pkill -RTMIN+15 someblocks
pkill -RTMIN+11 someblocks
pkill -RTMIN+10 someblocks
pkill -RTMIN+2 someblocks
