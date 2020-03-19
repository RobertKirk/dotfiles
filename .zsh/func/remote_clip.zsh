#!/usr/bin/env zsh

SSH_REMOTE_CLIPBOARD_PORT=5556

remote_clip_daemon() {
  while (true); do
    echo "Waiting..."
    nc -l -p $SSH_REMOTE_CLIPBOARD_PORT localhost | xclip
    echo "Copied: "
    xclip -o | sed 's/^/  /'
  done
}

start_clip_daemon() {
  remote_clip_daemon &> /var/log/remote_clip_daemon.log
}

xclip() {
  if (printenv SSH_CLIENT > /dev/null); then
    nc -q0 localhost $SSH_REMOTE_CLIPBOARD_PORT "$@"
  else
    command xclip "$@"
  fi
}
