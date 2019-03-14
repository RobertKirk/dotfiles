# DISPLAY{{{
# Powerlevel9k{{{
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir virtualenv anaconda vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

POWERLEVEL9K_LINUX_UBUNTU_ICON=""
POWERLEVEL9K_OS_ICON_FOREGROUND="red"

POWERLEVEL9K_VCS_GIT_ICON=""

POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_end"

POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
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
# ZSH_THEME=""
#}}}
#}}}
# ZSH{{{
# History Settings{{{
unsetopt share_history
unsetopt inc_append_history
setopt append_history

#}}}
# General ZSH settings {{{
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

#}}}
#plugins{{{
plugins=(git sudo command-not-found debian docker extract pip python tmux websearch)

#}}}
# vi-mode{{{
# bindkey -v
export KEYTIMEOUT=10
# bindkey -M viins 'jk' vi-cmd-mode
# bindkey -M viins '^S' sudo-command-line

#}}}
# tmux config {{{
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_FIXTERM="true"

#}}}
#}}}
# OH-MY-ZSH{{{
# oh-my-zsh installation.{{{
export ZSH="/home/robert/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
#}}}
#}}}
# EXTERNAL{{{
# Editor {{{
export EDITOR='vim'

#}}}
# Athame {{{
export ATHAME_SHOW_MODE=1
export ATHAME_SHOW_COMMAND=1
export ATHAME_TEST_RC=~/.athamerc
unset zle_bracketed_paste
#}}}
# Z autojumper{{{
eval "$(lua5.3 ~/repos/z.lua/z.lua --init zsh enhanced)"

#}}}
# pyenv{{{
[[ -d ~/.pyenv ]] || curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
export PATH="/home/robert/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#}}}
#}}}
# SCRIPTS{{{
export SCRIPTS_ROOT='/home/robert/repos/personal/scripts'
export GIT_WORKTREE_DIR='/home/robert/git-worktrees'
source $SCRIPTS_ROOT/git_worktrees.sh
#}}}
# Powerline{{{
# powerline-daemon -q
# . /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh

#}}}
# vim:foldmethod=marker:foldlevel=0
