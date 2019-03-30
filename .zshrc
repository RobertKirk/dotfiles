export EDITOR='vim'
# DISPLAY{{{
# Powerlevel9k{{{
export term="xterm-256color"
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv anaconda vcs background_jobs newline vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time time)

POWERLEVEL9K_VCS_GIT_ICON=""

POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="025"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="007"

POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="022"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="148"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_end"

POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"

POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=""
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=""

POWERLEVEL9K_PYTHON_ICON=""
POWERLEVEL9K_VIRTUALENV_BACKGROUND="023"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="white"

POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="darkred"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="darkyellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="darkgreen"

ZSH_THEME="powerlevel9k/powerlevel9k"
#}}}
# dircolors{{{
eval $( dircolors -b $HOME/.dircolors )
#}}}
#}}}
# ZSH{{{
unsetopt share_history
unsetopt inc_append_history
setopt append_history

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit

#}}}
# OH-MY-ZSH{{{
#plugins{{{
plugins=(fd git sudo command-not-found ripgrep vi-mode extract python tmux)

#}}}
# tmux config {{{
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_FIXTERM="true"
ZSH_TMUX_AUTOQUIT="false"

#}}}
# vi-mode{{{
export KEYTIMEOUT=10

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins '^S' sudo-command-line

bindkey -M vicmd '^S' sudo-command-line
bindkey -M vicmd "^V" edit-command-line

#}}}

export ZSH="/home/robert/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
#}}}
# EXTERNAL{{{
source ~/repos/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
source ~/repos/zsh-vimode-visual/zsh-vimode-visual.zsh
source ~/repos/forgit/forgit.plugin.zsh
source ~/repos/fancy-ctrl-z/fancy-ctrl-z.zsh
source ~/repos/zsh-abbrev-alias/abbrev-alias.plugin.zsh
abbrev-alias -g G="| rg"
abbrev-alias -g S="~/smarkets/"
abbrev-alias -i
source ~/.fzf.zsh
eval "$(lua5.3 ~/repos/z.lua/z.lua --init zsh enhanced once fzf)"

# pyenv{{{
export PATH="/home/robert/repos/pyenv/bin:$PATH"
eval "$(pyenv init -)"

#}}}
#}}}
# SCRIPTS{{{
. ~/.aliases.sh
. /home/robert/anaconda3/etc/profile.d/conda.sh

for f in ~/scripts/zsh/*; do
  # Exclude directories, i.e. '.', '..'
  [ ! -d "$f" ] || continue
  source $f
done
#}}}
# Powerline{{{
# ZSH_THEME=""
# powerline-daemon -q
# . /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh

#}}}
# vim:foldmethod=marker:foldlevel=0
