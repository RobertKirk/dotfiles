# Setup fzf
# ---------
if [[ ! "$PATH" == */home/robert/.fzf/bin* ]]; then
  export PATH="$PATH:/home/robert/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/robert/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/robert/.fzf/shell/key-bindings.zsh"

