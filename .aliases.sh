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
alias gpb='git push'
alias gpbf='git push -f'
alias gsh='git show'
alias gshh='git show HEAD'
alias gsth='git stash'
alias gsthl='git stash list'
alias gsthpm='git stash push -m'
alias gsthd='git stash drop'
alias grs='git reset'
alias gupdb='git fetch origin master:master && git rebase master'
alias :x='exit'
alias :q='exit'

unalias gd
gd() {
  git diff "$@" | diff-so-fancy | less -R~FX
}

gdp() {
  git diff "$@" | diff-so-fancy | less -R~
}

gstatall() {
  (git status -s .; (git status -s . | awk '{ print $2 }'; git ls-files) | sort | uniq -c | grep 1 | awk '{ print " \033[34mU \033[0m" $2 }')
}

addnewlines() {
  git ls-files -z | while IFS= read -rd '' f; do tail -c1 < "$f" | read -r _ || echo >> "$f"; done
}

gitrmuntracked() {
  git status -s | rg '?' -F | xargs rm -rf
}

gitfixup() {
  if [ $# -eq 0 ]; then
    echo You must specify a prefix for the commit
    return 1
  fi;
  local prefix="$1:"
  local commit=$(git log --oneline | head -n 10 | rg $prefix -F | head -n 1 | awk '{ print $1 }')
  git commit . --fixup=$commit
  EDITOR=true VISUAL=true git rebase --interactive --autosquash $commit~1
  echo fixup done, state:
  git log --oneline | head -n 10
}

lastpasscp() {
  lpass show --clip --password $(lpass ls  | fzf | awk '{print $(NF)}' | sed 's/\]//g')
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

-() {
  popd
}

get_tags() {
  rm tags tags.temp tags.lock &> /dev/null
  rg --files | ctags -R --links=no --options-maybe=~/.ctags.d/ -L -
}

command_freq() {
  if [ $# -eq 0 ]; then
    local segments=3
  else
    local segments=$1
  fi
  cat .zsh_history | awk -F':' '/: / { print $3 }' | cut -c 3- | cut -d' ' -f -$segments | sort | uniq -c | sort -bg | tail -n 100
}

getkeycods() { xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }' }

calc() {
  printf "%s\n" "$*" | bc
}

# single letter aliases:
# alias a=
alias b='buku --suggest'
# alias c='shell command, for directories'
alias d='deactivate'
alias e='nvim'
alias f='fd'
alias g='git'
# alias h=
# alias i=
# alias j=
alias k='kubectl'
alias l='exa -l'
alias m='man'
# alias n=
# alias o=
# alias p=
# alias q=
# alias r=shell build-in command
alias s='sudo'
# alias t=
# alias u=
v() {
  if test $# -gt 0; then
    env nvim "$@"
  elif test -f Session.vim; then
    env nvim -S
  else
    env nvim -c Obsession
  fi
}
# alias w=
alias x='extract'
# alias y=
alias z='_zlua'

alias ag='apt-get'
alias agi='apt-get install'
alias album='tizonia --spotify-album'
alias fial='alias | rg'
alias jpn='jupyter notebook'
alias mkst='cd ~/repos/st && sudo make clean install'
alias peek='bat --pager="less -R~K"'
alias reload='source ~/.zshrc'
alias repo='cd ~/repos'
alias vwk='nvim +VimwikiIndex'
alias sudo='sudo '

alias tsk='cat ~/vimwiki/Tasks.wiki | fzf --layout reverse --height 50%'
alias neomutt='nocorrect neomutt'
alias ls='gls --color=always'
alias ll='ls -la'
alias l='ls -l'
if which exa &> /dev/null; then
  unalias ll
  unalias l
  alias ll='exa -la'
  alias l='exa -l'
  alias lt='exa -lT --group-directories-first -L 3 -I __pycache__'
fi;
alias mkdir='mkdir -p'
alias tree='tree -I '__pycache__''
alias gpuw='watch -n 1 -d -t nvidia-smi'
alias cplgvfs='nohup cpulimit -e gvfs -l 5  </dev/null >/dev/null &> & disown'
alias gentoken='head -c 24 /dev/urandom | base64'
alias dt='tty-clock -xcsB'
alias gpuw='watch -n 1 -d -t nvidia-smi'
alias gotop='gotop -c rob-solarized'
