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
  
  nbg=$(cat "$HOME/.cache/wal/colors.hs" | grep background= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ //g')
  nfg=$(cat "$HOME/.cache/wal/colors.hs" | grep foreground= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ //g')
  nc1=$(cat "$HOME/.cache/wal/colors.hs" | grep color1= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ //g')	
  nc2=$(cat "$HOME/.cache/wal/colors.hs" | grep color2= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ //g')	
  nc3=$(cat "$HOME/.cache/wal/colors.hs" | grep color3= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ //g')	
  nc4=$(cat "$HOME/.cache/wal/colors.hs" | grep color4= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ //g')
  nc5=$(cat "$HOME/.cache/wal/colors.hs" | grep color5= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ //g')
  nc6=$(cat "$HOME/.cache/wal/colors.hs" | grep color6= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ //g')

  cbg=$(cat "$HOME/.cache/wal/colors.hs" | grep background= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | pastel complement | pastel format )
  cfg=$(cat "$HOME/.cache/wal/colors.hs" | grep foreground= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | pastel complement | pastel format)
  cc1=$(cat "$HOME/.cache/wal/colors.hs" | grep color1= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | pastel complement | pastel format)	
  cc2=$(cat "$HOME/.cache/wal/colors.hs" | grep color2= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | pastel complement | pastel format)	
  cc3=$(cat "$HOME/.cache/wal/colors.hs" | grep color3= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | pastel complement | pastel format)	
  cc4=$(cat "$HOME/.cache/wal/colors.hs" | grep color4= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | pastel complement | pastel format)
  cc5=$(cat "$HOME/.cache/wal/colors.hs" | grep color5= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | pastel complement | pastel format)
  cc6=$(cat "$HOME/.cache/wal/colors.hs" | grep color6= | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | pastel complement | pastel format)

  printf "[colors]\n\nbackground=$bg\ntext=$fg\nprompt=$fg\nplaceholder=$c2\ninput=$fg\nmatch=$fg\nselection=$c4\nselection-text=$bg\nselection-match=$c3\ncounter=$c5\nborder=$fg" > "$HOME/.config/fuzzel/colors.ini"
  
  printf "@define-color cforeground $cfg;\n@define-color cbackground $cbg;\n @define-color ccolor1 $cc1;\n @define-color ccolor2 $cc2;\n @define-color ccolor3 $cc3;\n @define-color ccolor4 $cc4;\n @define-color ccolor5 $cc5;\n @define-color ccolor6 $cc6;" > "$HOME/.config/waybar/complement-colors.css"

  printf "layout {\nfocus-ring {\ninactive-color \"$nbg\"\nactive-color \"$nc1\"\n}\n}\n\nrecent-windows {\nhighlight {\nactive-color \"$nc1\"\nurgent-color \"$nc3\"\n}\n}" > "$HOME/.config/niri/colors.kdl"

  sleep 3600
done
