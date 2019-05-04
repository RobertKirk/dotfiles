#!/bin/zsh

ssh-history() {
  cat "$HISTFILE" | grep -E ";ssh\s" | sed -e 's/\s*$//' | sort | uniq -c | sort -nr | sed -e "s/^\s*[0-9]*\s//"
}

ssh-connect() {
  ssh-history | cut -d ";" -f 2- | fzf --height 30%
}
