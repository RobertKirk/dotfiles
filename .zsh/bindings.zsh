export KEYTIMEOUT=10

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins '^S' sudo-command-line

bindkey -M vicmd '^S' sudo-command-line
bindkey -M vicmd '^V' edit-command-line

bindkey -M vicmd '^K' history-substring-search-up

upwards() {
  zle vi-cmd-mode
  history-substring-search-up
}

zle -N upwards
bindkey -M viins '^K' upwards

bindkey -M viins '^L' forward-word
bindkey -M viins '^H' backward-word

# Detect empty enter, execute git status if in git dir
# magic-enter () {
#   if [[ -z $BUFFER ]]; then
#     if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
#       echo -ne '\n'
#       git status -sb
#     fi
#     zle accept-line
#   else
#     zle accept-line
#   fi
# }

# zle -N magic-enter

# Completion Mode
bindkey -M menuselect '^?' undo # Backspace for deleting suggesting completion as a whole.
bindkey -M menuselect '+' accept-and-hold # Accept the selection but keep the completion list open.
bindkey -M menuselect '^K' up-line-or-history # Navigate up completion.
bindkey -M menuselect '^J' down-line-or-history # Navigate down completion.
bindkey -M menuselect '^L' forward-char # Navigate right completion.
bindkey -M menuselect '^H' backward-char # Navigate left completion.
bindkey -M menuselect '^I' down-line-or-history # <Tab> to selection completion forward.
bindkey -M menuselect '^[[Z' reverse-menu-complete # <S-Tab> to select completion backward. bindkey "^M" magic-enter
