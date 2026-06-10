#!/usr/bin/dash
pkill wallpapers.lua
while true; do
    lua ~/Documents/code/lua/wallpapers.lua
    sleep 7200
done
