#!/bin/bash
album_art=$(playerctl metadata mpris:artUrl)
if [[ -z $album_art ]] 
then
   exit
fi
album_art=${album_art#file://}
echo $album_art
