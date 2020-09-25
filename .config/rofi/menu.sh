#printf "  " && echo $(curl wttr.in ) | awk '{printf $8 }' && printf " "
#weather requires weather-util
printf "  " &&  weather VOBG | awk 'NR == 8' | awk '{printf $2 }' | sed 's/\([a-z]\)\([a-z]*\)/\U\1\L\2/g' | sed 's/;//g' && printf " "
weather VOBG | awk 'NR == 8' | awk '{printf $3 }' | sed 's/;//g' && printf " "
#echo $(curl wttr.in ) | awk '{printf $9}'  
echo
echo
echo $(date '+ %H:%M' )
echo $(echo -n "  \t" && acpi | awk '{print $4} ')
echo " $(amixer -M get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1)"
echo $(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1 | sed 's/\&/\\&/g'| sed 's#\/#\\/#g')
 echo 
echo $( echo -n "      " && date '+ %A ')
