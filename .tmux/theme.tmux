set -g pane-border-style "fg=colour7"
set -g pane-active-border-style "fg=colour2"

set -g message-style "fg=colour7,bg=colour14"
set -g message-command-style "fg=colour2,bg=colour14"

status_right="#{prefix_highlight} "
# status_right="#{prefix_highlight} ╞  %R ╞  %a %d %b ╞  CPU #{cpu_percentage} ╞  RAM #{ram} "

set -g @prefix_highlight_output_prefix " "
set -g @prefix_highlight_output_suffix " "
set -g @prefix_highlight_show_copy_mode "on"
set -g @prefix_highlight_fg "colour2"
set -g @prefix_highlight_bg "colour7"
set -g @prefix_highlight_copy_mode_attr "fg=colour7,bg=colour1,bold"

set -g status-right-length 400
set -g status-right "$status_right"

set -g mode-style bg="black"

set -g status-style "bg=colour15"
set -g status-left "  #S "

set -g status-left-length 400
set -g status-style "bg=colour15,fg=colour14"

set -g mode-style reverse
set -g window-status-format " #I ⚡#W "
set -g window-status-style "bg=colour7,fg=colour14"
set -g window-status-current-format "#[bg=colour2,fg=colour15] #I ⚡#W "
set -g window-status-separator "  "

set -g status-position top

set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows off

set -g allow-rename on
setw -g automatic-rename on

setw -g automatic-rename-format "#{pane_current_command}  #{b:pane_current_path}#{?pane_in_mode,  #{pane_mode},}"

set -g status-interval 1

# vim:filetype=tmux
