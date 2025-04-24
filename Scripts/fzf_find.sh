#!/bin/bash

# Use fzf to select a file or directory
selected=$(find ~/ -type f -o -type d 2>/dev/null | fzf)

# If the user selected something, open it with nvim
if [ -n "$selected" ]; then
    if [ -d "$selected" ]; then
        # If it's a directory, open nvim in that directory
        nvim "$selected"
    else
        # If it's a file, open it directly
        nvim "$selected"
    fi
else
    echo "No selection made."
fi
