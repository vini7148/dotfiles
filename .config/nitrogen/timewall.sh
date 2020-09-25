#! /bin/sh

echo "text 0,0 '" > /home/vinayak/Pictures/Wallpaper/i3wm/time

date +%H\:%M | figlet -f /home/vinayak/.local/share/fonts/ANSI\ Regular.flf >> /home/vinayak/Pictures/Wallpaper/i3wm/time

echo \' >> /home/vinayak/Pictures/Wallpaper/i3wm/time

convert -size 390x130 xc:black -font "DejaVu-Sans-Mono" -pointsize 20 -fill "#00000000" -draw @/home/vinayak/Pictures/Wallpaper/i3wm/time /home/vinayak/Pictures/Wallpaper/i3wm/clock.png

composite /home/vinayak/Pictures/Wallpaper/i3wm/clock.png -gravity center /home/vinayak/Pictures/Wallpaper/i3wm/source.png /home/vinayak/Pictures/Wallpaper/i3wm/result.png

feh --bg-scale /home/vinayak/Pictures/Wallpaper/i3wm/result.png
