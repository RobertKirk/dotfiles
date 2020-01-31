abbrev-alias -g X="| xargs"
abbrev-alias -g G="| rg"
abbrev-alias -g L="| less"
abbrev-alias -g V="| xargs nvim"
abbrev-alias -g C="| xclip -sel c"
abbrev-alias -g S="| xargs sed -i"
abbrev-alias -i

alias -s pdf=zathura
alias -s html=firefox
alias -s {csv,js,css,less,md,wiki,rst,yml,yaml,toml,txt}=nvim

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

alias icat="kitty +kitten icat"

[ -f ~/repos/home/.aliases.sh ] && . ~/repos/home/.aliases.sh

[ -f ~/.aliases.sh ] && . ~/.aliases.sh

# named directories:
hash -d gwt=~/git-worktrees/smarkets
hash -d rp=~/repos
hash -d smk=~/smarkets
