# Setup fzf
# ---------
FZF_HOME="/usr/local/Cellar/fzf/0.24.4"
#s /usr/local/Cellar/fzf/0.24.4/shell/key-bindings.zsh
if [[ ! "$PATH" == */home/robert/.fzf/bin* ]]; then
  export PATH="$PATH:/home/robert/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZF_HOME/shell/key-bindings.zsh"
