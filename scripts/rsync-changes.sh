#!/bin/bash -l
##
## Keeps the remote synced to the current folder changes
## Initialises remote folder at startup

DEST="$1" # remote dest eg username@beaker.cs.ucl.ac.uk:~/dir1/dir2, or beaker:~/
via_tails="$2"
no_initialise="$3"
# EXCLUDES={'.git', '*/.git', '*.git', '__pycache__','*/__pycache__','wandb','logs'}

if [ $via_tails ]; then
  ssh_command='ssh -J tails'
else
  ssh_command='ssh'
fi

if [ -z "$DEST" ]; then exit 1; fi
echo dest= $DEST

if [ "$no_initialise" ];
then
  echo "Not Initialising"
else
  echo "Initialising"
  rsync -uazv --progress --exclude-from='rsync_excludes.txt' -e "$ssh_command" * ${DEST}/
  echo "Initialisation Complete!"
fi

echo "Waiting for files to change..."
fswatch -r -Ie ".*\.*~$" --event Updated . | grep -f rsync_excludes.txt -v --line-buffered  |\
while read file
do
        relpath=${file#$(pwd)/}
        echo rsyncing $relpath
        rsync -uazv --exclude-from='rsync_excludes.txt' -e "$ssh_command" $relpath ${DEST}/$relpath
        the_date=$(date)
        echo  "rsync $relpath complete at $the_date"
        echo
done
