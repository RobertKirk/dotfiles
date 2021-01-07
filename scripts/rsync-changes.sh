#!/bin/bash -l
##
## Keeps the remote synced to the current folder changes
##

DEST="$1" # remote dest eg username@beaker.cs.ucl.ac.uk:~/dir1/dir2
initialise="$2"
# EXCLUDES={'.git', '*/.git', '*.git', '__pycache__','*/__pycache__','wandb','logs'}

if [ -z "$DEST" ]; then exit 1; fi

if [ "$initial" ];
then
  echo "Not Initialising"
else
  echo "Initialising"
  rsync -uazv --progress --exclude-from='rsync_excludes.txt' -e 'ssh -J knuckles' * ${DEST}/
  echo "Initialisation Complete!"
fi

echo "Waiting for files to change..."
inotifywait -r -m -e close_write --format '%w%f' --exclude '/\.' . | grep -f rsync_excludes.txt -v --line-buffered  |\
while read file
do
        echo rsyncing $file
        rsync -uazv --progress --exclude-from='rsync_excludes.txt' -e 'ssh -J knuckles' $file ${DEST}/$file
        the_date=$(date)
        echo  "rsync $file complete at $the_date"
done
