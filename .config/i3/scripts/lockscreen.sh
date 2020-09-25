#!/bin/bash

###########################################
#	Made by
#       _                              _        
#      (_)                            (_)       
#  ___  _  ____    ___   ____   _   _  _   ____ 
# /___)| ||    \  / _ \ |  _ \ | | | || | / ___)
#|___ || || | | || |_| || | | | \ V / | |( (___ 
#(___/ |_||_|_|_| \___/ |_| |_|  \_/  |_| \____)

#	Check updates and give a look at my dotfiles here:
#		https://github.com/simonvic/dotfiles

###########################################

textColor=ffffffAA
font="LatoLight"

#Backgrounds available: image, blur (i3lock-color blur method), blurAndDim (uses scrot and imagemagick, slower)
backgroundType=blurAndDim
image=$HOME/Pictures/Wallpapers/mountain3.png
blurStrength=10
blur2Strength=0x10
dimStrength=69%

# Available options: circle, bars
indicatorType=circle
indicatorPos=960:740
# 960
timeString=%H:%M:%S
timePos=960:540
# 960 orignal
timeSize=150
dateString="%A,%d %B"
datePos=960:570
dateSize=20
verifyText=Verifying...
wrongText=Wrong!
noInputText=...
inputTypeColor=ffffffff
inputDeleteColor=ff1010ff
greeterSize=40

st=$($HOME/.config/i3/scripts/playerctl.sh info)
test=" () []" 
# Show currently playing song in the lockscreen as the greeter
if [[ "$st" == "$test" ]]; then
	showSongAsGreeter=false
else
	showSongAsGreeter=true
fi
# Will be overridden if showSongAsGreeter is set to true
greeterText="VINAYAK GOSWAMI"

# Settings for the circle
radius=90
ringWidth=15
insideColor=00000000
insideVerifyingColor=00000000
insideWrongColor=00000000
ringColor=00000000
ringVerifyingColor=ffffffff
ringWrongColor=7e57c2
separatorColor=7e57c2

# Settings for the bars
# 0 = down, 1 = up, 2 = both
barDirection=2
barMaxHeight=100
barWidth=25
barBaseWidth=1
barBaseColor=00000000
barStep=1
barPeriodicStep=10
barPosition=540

########################################################################

lock() {
	if [ $showSongAsGreeter = true ]; then
		greeterText=$($HOME/.config/i3/scripts/playerctl.sh info)
	fi
	
	case "$indicatorType" in
		circle)
args="--pass-media-keys --redraw-thread --force-clock \
--indpos=$indicatorPos --timepos=$timePos --datepos=$datePos \
--veriftext=$verifyText --wrongtext=$wrongText --noinputtext=$noInputText \
--radius=$radius --ring-width=$ringWidth \
--insidecolor=$insideColor --insidevercolor=$insideVerifyingColor --insidewrongcolor=$insideWrongColor --ringcolor=$ringColor --ringvercolor=$ringVerifyingColor --ringwrongcolor=$ringWrongColor --line-uses-ring \
--keyhlcolor=$inputTypeColor --bshlcolor=$inputDeleteColor --separatorcolor=$separatorColor \
--verifcolor=$textColor --wrongcolor=$textColor \
--timecolor=$textColor --timestr=$timeString --time-font=$font --timesize=$timeSize \
--datecolor=$textColor --datestr=$dateString  --date-font=$font --datesize=$dateSize \
--greetertext=$greeterText --greetercolor=$textColor --greeter-font=$font --greetersize=$greeterSize"
		;;
		bars)
args="--pass-media-keys --redraw-thread --force-clock \
--bar-indicator --bar-direction=$barDirection --bar-max-height=$barMaxHeight --bar-width=$barWidth --bar-base-width=$barBaseWidth --bar-color=$barBaseColor --bar-step=$barStep --bar-periodic-step=$barPeriodicStep --bar-position=$barPosition \
--indpos=$indicatorPos --timepos=$timePos --datepos=$datePos \
--veriftext=$verifyText --wrongtext=$wrongText --noinputtext=$noInputText \
--insidecolor=$insideColor --insidevercolor=$insideVerifyingColor --insidewrongcolor=$insideWrongColor --ringcolor=$ringColor --ringvercolor=$ringVerifyingColor --ringwrongcolor=$ringWrongColor --line-uses-ring \
--keyhlcolor=$inputTypeColor --bshlcolor=$inputDeleteColor --separatorcolor=$separatorColor \
--verifcolor=$textColor --wrongcolor=$textColor \
--timecolor=$textColor --timestr=$timeString --time-font=$font --timesize=$timeSize \
--datecolor=$textColor --datestr=$dateString  --date-font=$font --datesize=$dateSize \
--greetertext=$greeterText --greetercolor=$textColor --greeter-font=$font --greetersize=$greeterSize"
		;;
		*)
			args=""
		;;
	esac
	
	case "$backgroundType" in
		image)
			background="-i $image"
		;;
		blur)
			background="--blur=$blurStrength"
		;;
		blurAndDim)
			scrot -z -q 1 -o /tmp/lockscreenScreenshot.png && convert /tmp/lockscreenScreenshot.png -blur $blur2Strength -colorize $dimStrength /tmp/lockscreenScreenshot.png
			background="-i /tmp/lockscreenScreenshot.png"
		;;
		*)
			background="--color=333333"
		;;
	esac	
	
	echo ${dateString[@]}
	pgrep i3lock || i3lock $args --datestr="%A,%d %B" --greetertext="$greeterText" $background $extraArgs

}


case "$1" in
	-s | --suspend)
		suspend=true
		;&

	-l | --lock)
		lock=true
		[[ $suspend ]] || extraArgs="$extraArgs -n"
		;;
esac

# Activate lockscreen (and suspend if specified)
[[ $lock ]] && lock && { [[ $suspend ]] && systemctl suspend; }

exit 0
