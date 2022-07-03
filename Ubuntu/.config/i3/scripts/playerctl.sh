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


#	Default player to control
#	TO-DO make shortcut to change player on the fly
player=spotify

# Show more info abou author and song
moreInfo=true

# [WIP] Show the song cover (spotify) as the notification icon
# Sometimes you might not be able to see the image, set useSpotifyCache to false
# to directly download the image (it might take more time to show the notification)
songCover=true
useSpotifyCache=true

iconCachePath=$HOME/.cache/spotifyIcon
spotifyCachePath=$HOME/.cache/spotify/Browser/Cache

#	Default urgency level [Available: low, normal, critical]
urgency=low

#	For how much milliseconds the notification will stay visible
timeout=5000

#	Unique dunst notification id
uid=2595

# App name in dunst
appName="Playerctl"


function getTitle {
	playerctl -p "$player" metadata title
}

function getArtist {
	playerctl -p "$player" metadata artist
}

function getAlbum {
	playerctl -p "$player" metadata album
}

function getStatus {
	playerctl -p "$player" status
}

function fetchSpotifyIcon {
	if [ $useSpotifyCache = true ]; then
		for f in $(ls -r -d $spotifyCachePath/f*); do
		echo $f
			if [ $(file $f -b --extension) = "jpeg/jpg/jpe/jfif" ]; then
				icon=$f
				break
			fi
		done
	else
		wget $(playerctl metadata mpris:artUrl | sed s/open.spotify.com/i.scdn.co/g) -O $iconCachePath
		icon=$iconCachePath
	fi
}

function buildBody() {
	if [ $moreInfo = true ]; then
		printf "<big><b>$title</b></big><small> ($artist)\n$album\n<i>$player</i></small>"
	else
		printf "<big><b>$title</b></big><small> ($artist)</small>"
	fi
}

function sendNotification {
	if [ $songCover = false ]; then
		status=`getStatus`
		if [ $status = "Playing" ]; then
			icon=/usr/share/icons/Paper/scalable/actions/media-playback-start-symbolic.svg
		elif [ $status = "Paused" ]; then	
			icon=/usr/share/icons/Paper/scalable/actions/media-playback-pause-symbolic.svg
		fi
	else
		fetchSpotifyIcon
	fi
	artist=`getArtist`
	title=`getTitle`
	album=`getAlbum`
	body=`buildBody`
	
  # Send the notification
  dunstify -a "$appName" -i "$icon" -t "$timeout" -r "$uid" -u "$urgency" "$title" "$body"
  
}

function info() {
	artist=`getArtist`
	title=`getTitle`
	album=`getAlbum`
	if [ $moreInfo = true ]; then
		printf "$title ($artist) [$album]"
	else
		printf "$title ($artist)"
	fi
}

# if [ $(playerctl -l) != "No players were found" ]; then
	case $1 in
		play-pause)
			playerctl play-pause
			sendNotification
		;;
		stop)
			playerctl stop
			sendNotification
		;;
		next)
			playerctl next
			sendNotification
		;;
		previous)
			playerctl previous
			sendNotification
		;;
		info)
			info
		;;
	esac
# fi

#  -p "$player" 