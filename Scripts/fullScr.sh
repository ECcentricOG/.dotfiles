#!/bin/bash
# Launch Ghostty
ghostty &

# Wait for the window to appear, then force full screen
sleep 1
wmctrl -r :ACTIVE: -b add,fullscreen

