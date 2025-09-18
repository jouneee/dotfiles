#!/bin/bash
artist=$(playerctl metadata xesam:artist)
title=$(playerctl metadata xesam:title)
album_string="$artist - $title"

if [[ -z "$album_string" ]]; then
   exit
fi

echo "$album_string"
