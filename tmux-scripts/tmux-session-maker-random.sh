#!/usr/bin/env bash
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/Desktop/sandbox ~/Desktop/heady ~/Desktop ~/ -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

# Get the current date and time for the session name prefix
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create the session name with the timestamp
selected_name="${timestamp}_$(basename "$selected")"

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux a -t $selected_name

