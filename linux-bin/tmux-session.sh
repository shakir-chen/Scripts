#!/usr/bin/env bash
# Save and restore the state of tmux sessions and windows.
# Acknowledge: mislav dotfile .tmux-session
# https://github.com/mislav/dotfiles/blob
# achieve persist and restore the state & position of panes.
set -e

dump() {
  local d=$'\t'
  # "#S": name of session, "#W": name of window, #{pane_current_path}: current path
  # session_name window_name dir
  tmux list-panes -a -F "#S${d}#P${d}#{window_layout}${d}#{pane_current_command}${d}#{pane_current_path}${d}#{pane_pid}"
}

filter() {
  while IFS= read -r line ; do
      # session_name pane_name layout_name window_name dir ppid
      window_name=$(echo $line | cut -d " " -f 4)
      ppid=$(echo $line | rev | cut -d " " -f 1 | rev)
      echo $window_name $ppid
      echo "$line" >> ~/.tmux-session_temp
      if [[ $window_name = "bash" ]]; then
          continue
      fi
      echo "$(ps --ppid $ppid -o command | tail -1)" >> ~/.tmux-session_temp
  done < ~/.tmux-session
  mv ~/.tmux-session_temp ~/.tmux-session
}

save() {
  dump > ~/.tmux-session
  filter
}

terminal_size() {
  stty size 2>/dev/null | awk '{ printf "-x%d -y%d", $2, $1 }'
}

session_exists() {
  tmux has-session -t "$1" 2>/dev/null
}

add_window() {
  tmux new-window -d -t "$1:" -n "$2" -c "$3"
}

add_pane() {
  # tmux new-pane -d -t "$1:" -n "$2" -c "$3"
  tmux splitw -h -t "$1:$2" -c "$3"
}

new_session() {
  cd "$3" &&
  tmux new-session -d -s "$1" -n "$2" $4
}

restore() {
  tmux start-server
  local count=0
  local wincount=0
  local dimensions="$(terminal_size)"
  local win_last=0
  local session_last=0

  while IFS=$'\t' read session_name pane_name layout_name window_name dir ppid; do
    if ! [[ $session_name =~ ^-?[0-9]+$ ]]; then
        echo $session_last $win_last
        tmux send-keys -t "$session_last:$win_last" C-z "$session_name"
    fi
    if [[ -d "$dir" && $window_name != "log" && $window_name != "man" ]]; then
      if session_exists "$session_name"; then
        if [[ "$pane_name" == 0 ]]; then
            add_window "$session_name" "$window_name" "$dir"
            # echo $layout_name
            wincount=$(( wincount + 1 ))
        else
            add_pane "$session_name" "$wincount" "$dir"
            tmux select-layout -t "$session_name:$wincount" "$layout_name"
        fi
      else
        echo "$dimensions"
        new_session "$session_name" "$window_name" "$dir" "$dimensions"
        count=$(( count + 1 ))
        wincount=1
      fi
    fi
    session_last="$session_name"
    win_last=$wincount
  done < ~/.tmux-session

  echo "restored $count sessions"
}

case "$1" in
save | restore )
  $1
  ;;
* )
  echo "valid commands: save, restore" >&2
  exit 1
esac

