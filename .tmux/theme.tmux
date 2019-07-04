set -g pane-border-style "fg=colour14"
set -g pane-active-border-style "fg=colour2"

set -g message-style "fg=colour7,bg=colour14"
set -g message-command-style "fg=colour4,bg=colour14"

status_right=" %R | %a %d %b | CPU #{cpu_percentage} | RAM #{ram} |"

set -g status-right-length 400
set -g status-right "$status_right"

set -g mode-style 'bg=#3e4452'

set -g status-style "bg=colour15"
set -g status-left ""

set -g status-left-length 400
set -g status-style "bg=colour15,fg=colour14"

setw -g window-status-format ' #I | #W '
setw -g window-status-style "bg=colour14,fg=colour15"
setw -g window-status-current-format ' #I | #W '
setw -g window-status-current-style "bg=colour4,fg=colour15"
setw -g window-status-separator ' '

set -g status-position top

set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows off

set -g allow-rename off
