#!/bin/sh
if cap=$(xset -q | grep -o "Caps Lock:   off");then
    echo "$no CAPS OFF"
else
    echo "$no CAPS ON"
fi
