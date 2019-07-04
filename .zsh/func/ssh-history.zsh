#!/bin/zsh

ssh-history() {
  (cat "$HISTFILE" | awk '/;ssh / { print $3" "$4" "$5" "$6}' | grep -v awk; awk '{ print $1 }' ~/.ssh/known_hosts | awk -F',' '{ print $1 }') | sort | uniq -w 10
}

ssh-connect() {
  command=$(ssh-history | fzf --height 30%)
  ssh $command
}

alias sc='ssh-connect'
