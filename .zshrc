export EDITOR='nvim'
# Powerlevel9k{{{
export term="xterm-256color"
POWERLEVEL9K_MODE='nerdfont-complete'

PURE_POWER_MODE=fancy
source ~/.purepower

#}}}
# ZSH{{{
HISTSIZE=10000
SAVEHIST=1000000
HIST_STAMPS="yyyy-mm-dd"
setopt share_history
unsetopt inc_append_history
setopt append_history

setopt histignorespace
setopt histignoredups

setopt autocd
setopt correct
setopt globdots
setopt chasedots

setopt interactivecomments

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
#}}}
# tmux config {{{
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_FIXTERM="true"
ZSH_TMUX_AUTOQUIT="false"

#}}}
# zplug {{{
source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/fd", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh

zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme

zplug "zsh-users/zsh-completions"
zplug "michaelxmcbride/zsh-dircycle"
zplug "wfxr/forgit", defer:1
zplug "momo-lab/zsh-abbrev-alias"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug load

setopt monitor
#}}}
# Bindings{{{
export KEYTIMEOUT=10

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins '^S' sudo-command-line

bindkey -M vicmd '^S' sudo-command-line
bindkey -M vicmd '^V' edit-command-line

bindkey -M vicmd '' history-substring-search-up

bindkey  history-substring-search-up

# Bind Ctrl + Shift + Left key combination to backwards direction.
bindkey "[1;6D" _dircycle_insert_cycled_left
# Bind Ctrl + Shift + Right key combination to forwards direction.
bindkey "[1;6C" _dircycle_insert_cycled_right

#}}}
# EXTERNAL{{{
eval $( dircolors -b $HOME/.dircolors )
abbrev-alias -g G="| rg"
abbrev-alias -g L="| less"
abbrev-alias -g nv="| xargs nvim"
abbrev-alias -g S="~/smarkets/"
abbrev-alias -g C="| xclip -sel c"
abbrev-alias -i
source ~/.fzf.zsh
eval "$(lua5.3 ~/repos/z.lua/z.lua --init zsh enhanced once fzf)"
source /home/robert/anaconda3/etc/profile.d/conda.sh

# PATH{{{
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/repos/pyenv" 
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#}}}
#}}}
# SCRIPTS{{{
. ~/.aliases.sh

for f in ~/scripts/zsh/*; do
  # Exclude directories, i.e. '.', '..'
  [ ! -d "$f" ] || continue
  source $f
done

# Loading History
fc -Rn ~/.zsh_history
#}}}
# vim:foldmethod=marker:foldlevel=0
