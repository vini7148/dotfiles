#!/usr/bin/env bash

sudo rm -rf /tmp/*

# set the icon and a temporary location for the screenshot to be stored
icon="$HOME/Pictures/Lock.webp"
tmpbg='/tmp/screen.png'

# take a screenshot
scrot "$tmpbg"

# blur the screenshot by resizing and scaling back up
# convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"
convert "$tmpbg" -filter Gaussian -blur 0x8 "$tmpbg"

# overlay the icon onto the screenshot
# convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

# lock the screen with the blurred screenshot
i3lock -i "$tmpbg"
