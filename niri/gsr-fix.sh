#!/usr/bin/bash
if pgrep -f "gpu-screen-recorder">/dev/null; then
    exit 0
else
    # gpu-screen-recorder -w screen -s 1920x1080 -f 60 -a "default_output|default_input" -c mp4 -r 120 -replay-storage ram -bm cbr -q 8000 -o "$HOME/Videos"
    gpu-screen-recorder -w screen -f 1 -c mp4 -r 2 -replay-storage ram -bm cbr -q 1 -o "$HOME/Videos"
fi
