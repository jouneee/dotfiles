#!/bin/sh

xrdb merge ~/.Xresources &
/home/catwizard/.config/dwm/dwmc xrdb &
/usr/lib/xdg-desktop-portal-gtk &
/home/catwizard/.config/dwm/wallpapers.sh &
xset r rate 500 30 &
xrandr --output DP-0 --mode 2560x1440 --rate 144 &
picom &

dash ~/.config/dwm/bar.sh &
bash ~/.config/dwm/autostart.sh &
while type dwm >/dev/null; do dwm && continue || break; done


