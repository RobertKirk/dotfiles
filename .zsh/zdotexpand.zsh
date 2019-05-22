# https://stackoverflow.com/a/41420448
function rationalise-dot() {
  local MATCH # keep the regex match from leaking to the environment
  if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' ]]; then
      LBUFFER+=/..
  else
      zle self-insert
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert
