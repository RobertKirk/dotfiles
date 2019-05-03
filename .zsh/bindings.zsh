export KEYTIMEOUT=10

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins '^S' sudo-command-line

bindkey -M vicmd '^S' sudo-command-line
bindkey -M vicmd '^V' edit-command-line

bindkey -M vicmd '' history-substring-search-up

bindkey  history-substring-search-up
