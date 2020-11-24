#!/bin/sh
st=$(playerctl -p spotify status)

if [ "$st" = "Playing" ]
then
    echo "$st"
elif [ "$st" = "Paused" ]
then
    echo "$st"
else
    echo "$no"
fi