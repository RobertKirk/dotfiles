eval $( dircolors -b $HOME/.dircolors )
eval "$(lua5.3 ~/repos/z.lua/z.lua --init zsh enhanced once fzf)"
source ~/anaconda3/etc/profile.d/conda.sh

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/fd", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
  ZSH_TMUX_AUTOSTART="true"
  ZSH_TMUX_FIXTERM="true"
  ZSH_TMUX_AUTOQUIT="false"
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh

zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
  typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
  typeset -g ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX='autosuggest-orig-'
  typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE='20'
  typeset -g ZSH_AUTOSUGGEST_ASYNC_PTY_NAME='zsh_autosuggest_pty'
  typeset -ga ZSH_AUTOSUGGEST_STRATEGY=('history')

zplug "zsh-vi-more/vi-motions"
zplug "michaelxmcbride/zsh-dircycle"
zplug "wfxr/forgit", defer:1
zplug "momo-lab/zsh-abbrev-alias"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "hlissner/zsh-autopair", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug load
