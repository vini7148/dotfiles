# polybar/launch.sh

killall polybar

# for MONITOR in $(polybar --list-monitors | cut -d":" -f1);
# do
# 	polybar top &
# 	polybar bottom &
# done

polybar top &
polybar bottom &