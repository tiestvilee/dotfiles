#!/usr/bin/env bash
set -e

rm -rf .dotfiles
rm -rf dotfiles-master

curl -L https://github.com/tiestvilee/dotfiles/archive/master.zip -o master.zip
unzip master.zip 
rm -rf master.zip
./dotfiles-master/brew/setup.sh
rm -rf dotfiles-master

echo "----- clone dotfiles ----- "
git clone https://github.com/tiestvilee/dotfiles.git .dotfiles
pushd .dotfiles
git remote rm origin
git remote add origin git@github.com:tiestvilee/dotfiles.git
popd

echo "----- ssh ----- "
.dotfiles/ssh/setup.sh

echo "----- git ----- "
.dotfiles/git/setup.sh

# echo "----- gpg ----- "
#.dotfiles/gpg/setup.sh

echo "----- osx ----- "
.dotfiles/osx/setup.sh

echo "----- zsh ----- "
.dotfiles/zsh/setup.sh

echo "----- dev ----- "
.dotfiles/dev/setup.sh

