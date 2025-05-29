#!/bin/bash
album_art=$(playerctl -p spotify_player metadata mpris:artUrl)
status=$(playerctl -p spotify_player status)
if [[ -z $album_art || $status != "Playing" ]] 
then
   # spotify is dead, we should die too.
   echo "/home/foxikira/.config/waybar/media.png"
   exit
fi
curl -s  "${album_art}" --output "/tmp/cover.jpeg"
echo "/tmp/cover.jpeg"
