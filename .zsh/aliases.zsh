abbrev-alias -g G="| rg"
abbrev-alias -g L="| less"
abbrev-alias -g nv="| xargs nvim"
abbrev-alias -g S="~/smarkets/"
abbrev-alias -g C="| xclip -sel c"
abbrev-alias -i

alias -s pdf=zathura
alias -s html=firefox
alias -s {csv,js,css,less,md,wiki,rst}=nvim

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

if [[ $TERM = xterm-kitty ]]; then
  alias icat="kitty +kitten icat"
fi;

[ -f ~/repos/home/.aliases.sh ] && . ~/repos/home/.aliases.sh

[ -f ~/.aliases.sh ] && . ~/.aliases.sh
