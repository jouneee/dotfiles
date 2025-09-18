#!/bin/bash

sleep 10

# Set the path to the wallpapers directory
wallpapersDir="$HOME/Pictures/Wallpapers"

# Get a list of all image files in the wallpapers directory
wallpapers=("$wallpapersDir"/*)

while true; do
  wallpaperId=$(( RANDOM % ${#wallpapers[@]}))
  selectedWallpaper="${wallpapers[$wallpaperId]}"

  swww img $selectedWallpaper
  ~/.config/niri/change-wal.sh

  sleep 3600
done
