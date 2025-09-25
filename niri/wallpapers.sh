#!/bin/bash

# Set the path to the wallpapers directory
wallpapersDir="$HOME/Pictures/Wallpapers"

# Get a list of all image files in the wallpapers directory
wallpapers=("$wallpapersDir"/*)

while true; do
  wallpaperId=$(( RANDOM % ${#wallpapers[@]}))
  selectedWallpaper="${wallpapers[$wallpaperId]}"
  
  swww img -t simple $selectedWallpaper
  wal -i $selectedWallpaper --saturate 0.5
  
  bg=$(cat "$HOME/.cache/wal/colors.hs" | grep background= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')
  fg=$(cat "$HOME/.cache/wal/colors.hs" | grep foreground= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')
  c1=$(cat "$HOME/.cache/wal/colors.hs" | grep color1= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')	
  c2=$(cat "$HOME/.cache/wal/colors.hs" | grep color2= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')	
  c3=$(cat "$HOME/.cache/wal/colors.hs" | grep color3= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')	
  c4=$(cat "$HOME/.cache/wal/colors.hs" | grep color4= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')
  c5=$(cat "$HOME/.cache/wal/colors.hs" | grep color5= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')
  c6=$(cat "$HOME/.cache/wal/colors.hs" | grep color6= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')
  
  printf "[colors]\n\nbackground=$bg\ntext=$fg\nprompt=$fg\nplaceholder=$c2\ninput=$fg\nmatch=$fg\nselection=$c4\nselection-text=$bg\nselection-match=$c3\ncounter=$c5\nborder=$fg" > "$HOME/.config/fuzzel/colors.ini"

  sleep 3600
done
