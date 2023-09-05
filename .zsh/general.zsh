setopt autocd
setopt correct
setopt chasedots
setopt nobeep
setopt autolist
setopt recexact
setopt autopushd
setopt pushdignoredups
setopt pushdminus
setopt pushdsilent
setopt pushdtohome
setopt markdirs
unsetopt nomatch

typeset -g DIRSTACKSIZE=20

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

export LESS='--quit-if-one-screen --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
if type lesspipe.sh >/dev/null 2>&1; then
  export LESSOPEN='|lesspipe.sh %s'
fi
if type pygmentize >/dev/null 2>&1; then
  export LESSCOLORIZER='pygmentize'
fi
