function zle-keymap-select zle-line-init {
	# If it's not tmux then can use normal sequences
	if [[ -z "${TMUX}" ]]; then
		local vicmd_seq="\e[6 q"
		local viins_seq="\e[4 q"
		local vivis_seq="\e[2 q"
	else
		# In tmux, escape sequences to pass to terminal need to be
		# surrounded in a DSC sequence and double-escaped:
		# ESC P tmux; {text} ESC \
		# <http://linsam.homelinux.com/tmux/tmuxcodes.pdf>
		local vicmd_seq="\ePtmux;\e\e[6 q\e\\"
		local viins_seq="\ePtmux;\e\e[4 q\e\\"
		local vivis_seq="\ePtmux;\e\e[2 q\e\\"
	fi
  case $KEYMAP {
    vicmd)
      printf $vicmd_seq
      ;;
    viins)
      printf $viins_seq
      ;;
    vivis)
      printf $vivis_seq
      ;;
  }
}

# Change appearance
zle -N zle-keymap-select  # When vi mode changes
zle -N zle-line-init      # When a new line starts

# Fix backspace not working after returning from cmd mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char 
