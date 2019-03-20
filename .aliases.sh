if [ -f ~/repos/home/.aliases.sh ]; then;
  . ~/repos/home/.aliases.sh
fi

alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gc='git commit -v'
alias gp='git pull'
alias gco='git checkout'
alias gnb='git checkout -b'
alias grb='git rebase'
alias grbi='git rebase -i HEAD^^^^^^^'
alias grbm='git rebase master'
alias gpm='git checkout master && git pull'
alias gpb='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpbf='git push origin $(git rev-parse --abbrev-ref HEAD) -f'
alias gsh='git show'
alias gshh='git show HEAD'
alias gshh^='git show HEAD^'
alias gsth='git stash'
alias gsthl='git stash list'
alias gsthpm='git stash push -m'
alias gsthd='git stash drop'
alias grs='git reset'
alias gupdb='git checkout master && git pull && git checkout - && git rebase master'

alias v=vim
alias jpn='jupyter notebook'
alias album='tizonia --spotify-album'
alias lua='lua5.3'
alias ag="ag --color-line-number '1;133' --color-path '1;230'"
alias reload='source ~/.zshrc'
alias b='z -b'
alias album='tizonia --spotify-album'
alias l='l -al'
alias repo='cd ~/repos'
alias fial='alias | ag'
alias mkst='cd ~/repos/st && sudo make clean install'
alias vwk='vim +VimwikiIndex'

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
   source ~/.zshrc
}
