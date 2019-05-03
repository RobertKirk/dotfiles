alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gc='git commit -v'
alias gp='git pull'
alias gco='git checkout'
alias gnb='git checkout -b'
alias grb='git rebase'
alias grbi='git rebase -i HEAD~8'
alias grbm='git rebase master'
alias gpm='git checkout master && git pull'
alias gpb='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpbf='git push origin $(git rev-parse --abbrev-ref HEAD) -f'
alias gsh='git show'
alias gshh='git show HEAD'
alias gsth='git stash'
alias gsthl='git stash list'
alias gsthpm='git stash push -m'
alias gsthd='git stash drop'
alias grs='git reset'
alias gupdb='git checkout master && git pull && git checkout - && git rebase master'
alias gd='git diff | diff-so-fancy | sed "s/^\([^-+]*\)[-+]/\1/" | less -R~FX'
alias gdp='git diff | diff-so-fancy | sed "s/^\([^-+]*\)[-+]/\1/" | less -R~'

lastpasscp() {
    lpass show -c --password $(lpass ls  | fzf | awk '{print $(NF)}' | sed 's/\]//g')
}

iconecho() {
    echo -e "\\u$1"
}

get_colors() {
    for i in {0..255};
        do printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ;
        if ! (( ($i + 1 ) % 8 ));
            then echo ;
        fi ;
    done
}

mkalias() {
    echo "alias $1='$2'" >> ~/.aliases.sh
    source ~/.aliases.sh
}

addnewlines() {
    git ls-files -z | while IFS= read -rd '' f; do tail -c1 < "$f" | read -r _ || echo >> "$f"; done
}

alias v='nvim'
alias jpn='jupyter notebook'
alias album='tizonia --spotify-album'
alias reload='source ~/.zshrc'
alias b='z -b'
alias album='tizonia --spotify-album'
alias repo='cd ~/repos'
alias fial='alias | ag'
alias mkst='cd ~/repos/st && sudo make clean install'
alias vwk='nvim +VimwikiIndex'
alias peek='bat --pager="less -R~K"'

alias tsk='cat ~/vimwiki/Tasks.wiki | fzf --layout reverse --height 50%'
alias neomutt='nocorrect neomutt'
alias ls='ls --color=always'
alias ll='ls --color=always -al'
alias l='ls --color=always -l'
alias mkdir='mkdir -p'
alias tree='tree -I '__pycache__''
alias gpuw='watch -n 1 -d -t nvidia-smi'
alias cplgvfs='nohup cpulimit -e gvfs -l 5  </dev/null >/dev/null 2>&1 & disown'
