#!/usr/bin/env bash

echo $((`cat /sys/class/backlight/intel_backlight/brightness` + 100)) | sudo tee /sys/class/backlight/intel_backlight/brightness