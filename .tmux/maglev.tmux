#!/usr/bin/env bash
set -e

apply_theme() {
    left_separator=''
    left_separator_black=''
    right_separator=''
    right_separator_black=''
    session_symbol=''

    # panes
    pane_border_fg=colour14
    pane_active_border_fg=colour2

    tmux set -g pane-border-style fg=$pane_border_fg \; set -g pane-active-border-style fg=$pane_active_border_fg

    display_panes_active_colour=colour4 # blue
    display_panes_colour=colour4 # blue
    tmux set -g display-panes-active-colour $display_panes_active_colour \; set -g display-panes-colour $display_panes_colour

    # messages
    message_fg=colour5
    message_bg=colour0
    message_attr=bold
    tmux set -g message-style fg=$message_fg,bg=$message_bg,$message_attr

    message_command_fg=colour5
    message_command_bg=colour0
    tmux set -g message-command-style fg=$message_command_fg,bg=$message_command_bg,$message_attr

    # windows mode
    mode_fg=colour16   # black
    mode_bg=colour11   # yellow
    mode_attr=bold
    tmux setw -g mode-style fg=$mode_fg,bg=$mode_bg,$mode_attr

    # status line
    status_fg=colour8 # white
    status_bg=color14 # dark gray
    tmux set -g status-style fg=$status_fg,bg=$status_bg

    session_fg=colour16  # black
    session_bg=colour11 # yellow
    status_left="#[fg=$session_fg,bg=$session_bg,bold] #S #[fg=$session_bg,bg=$status_bg,nobold]$left_separator_black"
    if [ x"`tmux -q -L tmux_theme_status_left_test -f /dev/null new-session -d \; show -g -v status-left \; kill-session`" = x"[#S] " ] ; then
        status_left="$status_left "
    fi
    tmux set -g status-left-length 32 \; set -g status-left "$status_left"

    window_status_fg=colour253 # gray
    window_status_bg=colour0 # dark gray
    window_status_format="#I #W"
    tmux setw -g window-status-style fg=$window_status_fg,bg=$window_status_bg \; setw -g window-status-format "$window_status_format"

    window_status_current_fg=colour16 # black
    window_status_current_bg=colour4 # blue
    window_status_current_format="#[fg=$window_status_bg,bg=$window_status_current_bg]$left_separator_black#[fg=$window_status_current_fg,bg=$window_status_current_bg,bold] #I $left_separator #W #[fg=$window_status_current_bg,bg=$status_bg,nobold]$left_separator_black"
    tmux setw -g window-status-current-format "$window_status_current_format"
    tmux set -g status-justify left

    window_status_activity_fg=default
    window_status_activity_bg=default
    window_status_activity_attr=underscore
    tmux setw -g window-status-activity-style fg=$window_status_activity_fg,bg=$window_status_activity_bg,$window_status_activity_attr

    window_status_bell_fg=colour11 # yellow
    window_status_bell_bg=default
    window_status_bell_attr=blink,bold
    tmux setw -g window-status-bell-style fg=$window_status_bell_fg,bg=$window_status_bell_bg,$window_status_bell_attr

    window_status_last_fg=colour4 # blue
    window_status_last_attr=default
    tmux setw -g window-status-last-style $window_status_last_attr,fg=$window_status_last_fg

    status_right="︎#[fg=$time_date_fg,nobold]#{prefix_highlight} $right_separator %R $right_separator %a %d %b #[fg=$host_bg]"

    # Only show solid separator if CPU or Battery are to be displayed
    if [ "$SHOW_BATTERY" = true ] || [ "$SHOW_CPU" = true ]; then
        status_right="$status_right $right_separator_black#[fg=$host_fg,bg=$host_bg,bold]"
    fi

    if [ "$SHOW_BATTERY" = true ]; then
        status_right="$status_right #{battery_icon} #{battery_percentage}"
    fi

    # Only add intermediate separator if both CPU and Batter are to be displayed
    if [ "$SHOW_BATTERY" = true ] && [ "$SHOW_CPU" = true ]; then
        status_right="$status_right $right_separator"
    fi

    if [ "$SHOW_CPU" = true ]; then
        status_right="$status_right CPU #{cpu_percentage} "
    fi
    status_right="$status_right $right_separator RAM #{ram} $right_separator_black"
    status_right="$right_separator #{spotify_song} - #{spotify_artist} $status_right "

    tmux set -g status-right-length 400 \; set -g status-right "$status_right"
}

apply_theme
