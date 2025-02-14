#!/bin/bash
# Ensure aerospace is running before executing the command
while ! pgrep -x "aerospace" > /dev/null; do
    sleep 1
done

# Main loop
while true; do
    /usr/local/bin/sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$(/usr/local/bin/aerospace list-workspaces --focused)
    sleep 0.5
done
