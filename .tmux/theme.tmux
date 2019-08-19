
set -g pane-border-style "fg=colour7"
set -g pane-active-border-style "fg=colour2"

set -g message-style "fg=colour7,bg=colour14"
set -g message-command-style "fg=colour4,bg=colour14"

status_right="#{prefix_highlight} "
# status_right="#{prefix_highlight} ╞  %R ╞  %a %d %b ╞  CPU #{cpu_percentage} ╞  RAM #{ram} "

set -g @prefix_highlight_output_prefix '< '
set -g @prefix_highlight_output_suffix ' >'
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_fg "white"
set -g @prefix_highlight_bg "blue"
set -g @prefix_highlight_copy_mode_attr "fg=white,bg=red,bold"

set -g status-right-length 400
set -g status-right "$status_right"

set -g mode-style 'bg=#3e4452'

set -g status-style "bg=colour15"
set -g status-left ""

set -g status-left-length 400
set -g status-style "bg=colour15,fg=colour14"

setw -g mode-style reverse
setw -g window-status-format ' #I ╞ #W '
setw -g window-status-style "bg=colour7,fg=colour14"
setw -g window-status-current-format ' #I ╞ #W '
setw -g window-status-current-style "bg=colour4,fg=colour15"
setw -g window-status-separator ' '

set -g status-position top

set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows off

set -g allow-rename on

# vim:filetype=tmux
