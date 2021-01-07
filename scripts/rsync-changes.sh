#!/bin/bash -l
##
## Keeps the remote synced to the current folder changes
##

DEST="$1" # remote dest eg username@beaker.cs.ucl.ac.uk:~/dir1/dir2
initialise="$2"
# EXCLUDES={'.git', '*/.git', '*.git', '__pycache__','*/__pycache__','wandb','logs'}

if [ -z "$DEST" ]; then exit 1; fi
echo dest= $DEST

if [ "$initialise" ];
then
  echo "Not Initialising"
else
  echo "Initialising"
  rsync -uazv --progress --exclude-from='rsync_excludes.txt' -e 'ssh -J tails' * ${DEST}/
  echo "Initialisation Complete!"
fi

echo "Waiting for files to change..."
fswatch -r -Ie ".*\.*~$" --event Updated . | grep -f rsync_excludes.txt -v --line-buffered  |\
while read file
do
        relpath=${file#$(pwd)/}
        echo rsyncing $relpath
        rsync -uazv --exclude-from='rsync_excludes.txt' -e 'ssh -J tails' $relpath ${DEST}/$relpath
        the_date=$(date)
        echo  "rsync $relpath complete at $the_date"
        echo
done
