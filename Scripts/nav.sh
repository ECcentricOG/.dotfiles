#!/bin/bash

# Show list of all files and directories under ~
target=$(find ~ -print 2>/dev/null | sed "s|^$HOME|~|" | fzf --prompt="Select or Type a path: " --print-query --expect=enter)

# Extract the last line (the selected path)
selected=$(echo "$target" | tail -n 1)

# Convert ~ back to $HOME
selected="${selected/#\~/$HOME}"

# If empty, exit
if [ -z "$selected" ]; then
    echo "No selection made."
    exit 1
fi

# If path is directory
if [ -d "$selected" ]; then
    echo "Changing directory to $selected"
    cd "$selected" || exit
    exec $SHELL # Start new shell in that directory
elif [ -f "$selected" ]; then
    echo "Opening file $selected with Neovim..."
    nvim "$selected"
else
    # Ask user: create directory or file?
    echo "$selected does not exist."
    read -p "Create as (d)irectory or (f)ile? [d/f]: " choice
    if [ "$choice" == "d" ]; then
        mkdir -p "$selected"
        echo "Directory created: $selected"
        cd "$selected" || exit
        exec $SHELL
    else
        mkdir -p "$(dirname "$selected")"
        touch "$selected"
        echo "File created: $selected"
        nvim "$selected"
    fi
fi

