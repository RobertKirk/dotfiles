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
# bindkey "^M" magic-enter
