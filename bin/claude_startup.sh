#!/usr/bin/env bash

SESSION=$(basename "$PWD")

if tmux has-session -t "$SESSION" 2>/dev/null; then
  tmux attach-session -t "${SESSION}:claude"
  exit 0
fi

tmux new-session -d -s "$SESSION" -n "claude"

tmux new-window -t "${SESSION}" -n "Andrew"

tmux select-window -t "${SESSION}:claude"
tmux send-keys -t "${SESSION}:claude" "claude --model opusplan" C-m

tmux attach-session -t "${SESSION}:claude"
