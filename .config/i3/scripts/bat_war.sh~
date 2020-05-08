#!/bin/bash

export DISPLAY=:0
export $(dbus-launch | grep 'ADDRESS')
export $(dbus-launch | grep 'PID')

batlev=$(cat /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:22/PNP0C09:00/PNP0C0A:00/power_supply/BAT0/capacity)
batstat=$(cat /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:22/PNP0C09:00/PNP0C0A:00/power_supply/BAT0/status)

wmctrl -c 'LOW BAT ALERT'

if [[ "$batstat" = "Discharging" ]]; then

 if [[ $batlev -le 10 ]]; then
  zenity --error --title 'LOW BAT ALERT' --text="BATTERY TOO LOW. SUSPENDING SYSTEM IN 15 SECONDS." &
  sleep 15
  batstat=$(cat /sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:08/PNP0C09:00/PNP0C0A:00/power_supply/BAT0/status)
  if [[ "$batstat" = "Discharging" ]]; then
   #kill -KILL $(ps -ax | grep 'zenity --error --text=BATTERY TOO LOW. SUSPENDING SYSTEM IN 15 SECONDS.' | grep -v grep | sed -e 's/\ .*$//')
   wmctrl -c 'LOW BAT ALERT'
   zenity --info --title 'Suspended' --text="The system was suspended because of low battery level." &
   sudo pm-suspend
  else
   #kill -KILL $(ps -ax | grep 'zenity --error --text=BATTERY TOO LOW. SUSPENDING SYSTEM IN 15 SECONDS.' | grep -v grep | sed -e 's/\ .*$//')
   wmctrl -c 'LOW BAT ALERT'
  fi
 elif [[ $batlev -le 20 ]]; then
  zenity --warning --title 'LOW BAT ALERT' --text="LOW BATTERY! CONNECT TO POWER NOW!" &
 fi

fi
