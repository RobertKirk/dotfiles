abbrev-alias -g G="| rg"
abbrev-alias -g L="| less"
abbrev-alias -g nv="| xargs nvim"
abbrev-alias -g S="~/smarkets/"
abbrev-alias -g C="| xclip -sel c"
abbrev-alias -i

[ -f ~/repos/home/.aliases.sh ] && . ~/repos/home/.aliases.sh

[ -f ~/.aliases.sh ] && . ~/.aliases.sh
