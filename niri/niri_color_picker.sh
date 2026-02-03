#!/usr/bin/dash
niri msg pick-color | grep Hex | awk '{print $2}' | wl-copy
