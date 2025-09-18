#!/bin/bash

sleep 2

CURRENT_BACKGROUND=$(swww query | awk '{print $8}')
wal -i $CURRENT_BACKGROUND --saturate 0.5
