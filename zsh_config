# Powerlevel9k
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

# trying out powerline
powerline-daemon -q
. /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh

# tmux zsh config
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_FIXTERM="true"

# lua z autojumper install
eval "$(lua5.3 ~/repos/z.lua/z.lua --init zsh enhanced)"

unsetopt share_history
unsetopt inc_append_history
setopt append_history

# Path to your oh-my-zsh installation.
export ZSH="/home/robert/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel9k/powerlevel9k"

HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git sudo command-not-found debian docker extract pip python tmux websearch)

# vi-mode stuff
# bindkey -v
export KEYTIMEOUT=10
# bindkey -M viins 'jk' vi-cmd-mode

source $ZSH/oh-my-zsh.sh

# bindkey -M viins '^S' sudo-command-line

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Athame working
export ATHAME_SHOW_MODE=1
export ATHAME_SHOW_COMMAND=1
export ATHAME_TEST_RC=~/.athamerc
unset zle_bracketed_paste

