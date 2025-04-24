#!/bin/bash

# Use fzf to select a file or directory
selected=$(find ~/ -type f -o -type d 2>/dev/null | fzf)

# Check if something was selected
if [ -z "$selected" ]; then
    echo "No selection made."
    exit 1
fi

# Get directory of selected item
if [ -d "$selected" ]; then
    workdir="$selected"
    nvim_target="."
else
    workdir=$(dirname "$selected")
    nvim_target="$selected"
fi

# Generate a unique tmux session name
session=$(basename "$workdir" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')

# Start a detached tmux session with nvim running in the first window
tmux new-session -d -s "$session" -c "$workdir" "nvim '$nvim_target'"

# Create 3 additional windows (tabs) in the same directory
tmux new-window -t "$session" -c "$workdir" -n "server"
tmux new-window -t "$session" -c "$workdir" -n "database"
tmux new-window -t "$session" -c "$workdir" -n "terminal" # Switch to the first window

tmux select-window -t "$session:1"

# Attach to the session
tmux attach-session -t "$session"

