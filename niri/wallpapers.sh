#!/usr/bin/bash

wallpapersDir="$HOME/Pictures/Wallpapers"
wallpapers=("$wallpapersDir"/*)
history_file="$HOME/.cache/wallpaper_history"
wal_file="$HOME/.cache/wal/colors.hs"

history=()

[ -f $history_file ] && mapfile -t history < "$history_file"
if (( ${#history[@]} > 4 )); then
    history=("${history[@]: -4}")
fi

while true; do
    wallpaperId=$(( RANDOM % ${#wallpapers[@]}))
    selectedWallpaper="${wallpapers[$wallpaperId]}"

    in_history=false
    for h in "${history[@]}"; do
    if [[ "$h" == "$selectedWallpaper" ]]; then
        in_history=true
        break
    fi
    done

    swww img -t simple --transition-fps 144 --transition-step 2 $selectedWallpaper
    wal -i $selectedWallpaper --saturate 0.5

    history+=("$selectedWallpaper")
    printf "%s\n" "${history[@]}" > "$history_file"
    if (( ${#history[@]} > 4 )); then
        history=("${history[@]:1}")
    fi

    bg=$(grep 'background=' "$wal_file" | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')
    fg=$(grep 'foreground=' "$wal_file" | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')
    c1=$(grep 'color1=' "$wal_file" | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')	
    c2=$(grep 'color2=' "$wal_file" | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')	
    c3=$(grep 'color3=' "$wal_file" | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')	
    c4=$(grep 'color4=' "$wal_file" | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')
    c5=$(grep 'color5=' "$wal_file" | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')
    c6=$(grep 'color6=' "$wal_file" | awk -F"=" '{print $2}' | sed 's/"//g' | tr '\n' ' ' | sed 's/ /ff/g')

    nbg=$(echo $bg | sed 's/ff//g')
    nfg=$(echo $fg | sed 's/ff//g')
    nc1=$(echo $c1 | sed 's/ff//g')	
    nc2=$(echo $c2 | sed 's/ff//g')	
    nc3=$(echo $c3 | sed 's/ff//g')	
    nc4=$(echo $c4 | sed 's/ff//g')
    nc5=$(echo $c5 | sed 's/ff//g')
    nc6=$(echo $c6 | sed 's/ff//g')

    cbg=$(echo $bg | pastel complement | pastel format)
    cfg=$(echo $fg | pastel complement | pastel format)
    cc1=$(echo $c1 | pastel complement | pastel format)	
    cc2=$(echo $c2 | pastel complement | pastel format)	
    cc3=$(echo $c3 | pastel complement | pastel format)	
    cc4=$(echo $c4 | pastel complement | pastel format)
    cc5=$(echo $c5 | pastel complement | pastel format)
    cc6=$(echo $c6 | pastel complement | pastel format)

    printf "[colors]\n\nbackground=$bg\ntext=$fg\nprompt=$fg\nplaceholder=$c2\ninput=$fg\nmatch=$fg\nselection=$c4\nselection-text=$bg\nselection-match=$c3\ncounter=$c5\nborder=$fg" > "$HOME/.config/fuzzel/colors.ini"
    printf "@define-color cforeground $cfg;\n@define-color cbackground $cbg;\n @define-color ccolor1 $cc1;\n @define-color ccolor2 $cc2;\n @define-color ccolor3 $cc3;\n @define-color ccolor4 $cc4;\n @define-color ccolor5 $cc5;\n @define-color ccolor6 $cc6;" > "$HOME/.config/waybar/complement-colors.css"
    printf "layout {\nfocus-ring {\ninactive-color \"$nbg\"\nactive-color \"$nc1\"\n}\n}\n\nrecent-windows {\nhighlight {\nactive-color \"$nc1\"\nurgent-color \"$nc3\"\n}\n}" > "$HOME/.config/niri/colors.kdl"

    for pid in $(pgrep nvim); do
        nvim --server /run/user/1000/nvim.${pid}.0 --remote-expr "execute('ReloadWal')"
    done

    sleep 3600
done

