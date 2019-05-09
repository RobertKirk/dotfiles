#!/usr/bin/env bash

pushd /usr/lib/slack/resources/app.asar.unpacked/src/static/
sudo mv slack-taskbar-highlight-linux.png slack-taskbar-highlight-linux-backup.png
sudo mv slack-taskbar-unread-linux.png slack-taskbar-unread-linux-backup.png
sudo cp slack-taskbar-rest-linux.png slack-taskbar-highlight-linux.png
sudo cp slack-taskbar-rest-linux.png slack-taskbar-unread-linux.png
popd > /dev/null 2>&1
