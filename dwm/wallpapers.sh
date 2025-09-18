#!/bin/bash

sleep 3

# Set the path to the wallpapers directory
wallpapersDir="$HOME/Pictures/Wallpapers"

# Get a list of all image files in the wallpapers directory
wallpapers=("$wallpapersDir"/*)

while true; do
  wallpaperId=$(( RANDOM % ${#wallpapers[@]}))
  selectedWallpaper="${wallpapers[$wallpaperId]}"

  feh --bg-fill $selectedWallpaper
  wal -i $selectedWallpaper --saturate 0.5
  
  sleep 1

  bg=$(cat /home/catwizard/.cache/wal/colors.hs | grep background | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ')
  fg=$(cat /home/catwizard/.cache/wal/colors.hs | grep foreground | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ')
  c1=$(cat /home/catwizard/.cache/wal/colors.hs | grep color1= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ')	
  c2=$(cat /home/catwizard/.cache/wal/colors.hs | grep color2 | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ')	
  c3=$(cat /home/catwizard/.cache/wal/colors.hs | grep color3 | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ')	
  c4=$(cat /home/catwizard/.cache/wal/colors.hs | grep color4 | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ')
  c5=$(cat /home/catwizard/.cache/wal/colors.hs | grep color5 | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ')
  c6=$(cat /home/catwizard/.cache/wal/colors.hs | grep color6 | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ')	

  printf "dwm.normbgcolor:$bg \ndwm.normfgcolor:$fg \ndwm.normbordercolor:$bg \ndwm.selbordercolor:$c1 \ndwm.selbgcolor: $bg \ndwm.selfgcolor: $fg" > /home/catwizard/.Xresources
 
  xrdb merge /home/catwizard/.Xresources
  /home/catwizard/.config/dwm/dwmc xrdb

  sleep 3600
done
