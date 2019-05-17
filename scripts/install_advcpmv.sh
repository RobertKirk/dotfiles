#!/bin/sh

if (which cpg); then
  if (which mvg); then
    exit 0
  fi;
fi;

cd $HOME/repos
if [ -d coreutils-8.30 ]; then
  exit 0
fi;
wget http://ftp.gnu.org/gnu/coreutils/coreutils-8.30.tar.xz
tar xvJf coreutils-8.30.tar.xz
cd coreutils-8.30/
wget https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.8-8.30.patch
patch -p1 -i advcpmv-0.8-8.30.patch
./configure
make

cp .src/cp $HOME/.local/bin/cpg
cp .src/mv $HOME/.local/bin/mvg

echo "add aliases to ~/.aliases.sh ? [y/N]"
read resp
if [ $resp = 'y' ]; then
  echo alias cp $HOME/.local/bin/cpg -g >> $HOME/.aliases.sh
  echo alias mv $HOME/.local/bin/mvg -g >> $HOME/.aliases.sh
  echo "aliases added"
  exit 0
fi;
echo 'no aliases added'
echo 'if you want to add aliases, use the following commands:'
echo "echo alias cp $HOME/.local/bin/cpg -g >> $HOME/.aliases.sh"
echo "echo alias mv $HOME/.local/bin/mvg -g >> $HOME/.aliases.sh"
