#!/bin/bash, execution: bash top-server.sh

session="server-top"
window=${session}:0

for ((i=1; i<=4; i++))
do
    # pane=${window}:1
    pane=${window}.$i
    if [[ "$1" == "" ]]
    then
        tmux send-keys -t "$pane" C-z 'top' Enter
    else
        tmux send-keys -t "$pane" C-z $1 Enter
    fi
done

# tmux select-pane -t "$pane"
# tmux select-window -t "$window"
# tmux attach-session -t "$session"
