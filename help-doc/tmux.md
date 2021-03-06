TMUX
===========

# session command
new window              a+c
next session            a+n
previous session        a+p
detach session          a+d
help                    a+?
help                    a+?

<http://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/>
# commandline
tmux list-keys
tmux list-commands
tmux list-keys -t vi-copy

<https://robots.thoughtbot.com/a-tmux-crash-course>


# copy and paste
```
# ~/.tmux.conf
bind P paste-buffer
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection
bind-key -t vi-copy 'r' rectangle-toggle
```


<http://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting/>

# mouse
set -g mouse on         # support mouse scroll and resize pane

<https://stackoverflow.com/questions/4889724/how-can-you-easily-tell-which-pane-in-tmux-is-focused>

# Pane, windows and UI
```
# Status bar customization
set -g status-utf8 on
set -g status-bg black
set -g status-fg white
set -g status-interval 5
set -g status-left-length 90
set -g status-right-length 60
set -g status-justify left
set -g status-right '#[fg=Cyan]#S #[fg=white]%a %d %b %R' 
```

<https://danielmiessler.com/study/tmux/#gs.1CkwJQ0>

# Nested Tmux with ssh
```
bind-key b send-prefix

ctrl-b   c  # create new window in the outer session
ctrl-b b c  # create new window in the inner session
ctrl-b   %  # create split window in the outer session
ctrl-b b %  # create split window in the inner session
```
<https://stackoverflow.com/questions/17920947/how-to-pass-command-keys-to-a-remote-tmux-session-when-you-ssh-from-a-local-tmux>
<http://stahlke.org/dan/tmux-nested/>


Really Impressive: use $SSH_AUTH_SOCK   and  $SSH_CONNECTION
<https://github.com/bradwright/dotfiles/blob/master/tmux.conf>

# condition
if-shell "cond" "exe1" "exe2"
<https://superuser.com/questions/539595/tmux-configuration-conditional-to-os>


