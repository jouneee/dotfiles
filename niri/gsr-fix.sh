#!/usr/bin/bash
if pgrep -f "gpu-screen-recorder">/dev/null; then
    exit 0
else
    gpu-screen-recorder -w screen -f 60 -a default_output -c mp4 -r 120 -replay-storage ram -bm cbr -q 5000 -o "$HOME/Videos"
fi
