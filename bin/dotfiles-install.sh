#!/bin/bash

if ! command -v git > /dev/null; then
  echo "installing git"
  sudo apt install -y git
fi

function dotfiles {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

git clone --bare https://github.com/retrocraft/dotfiles.git $HOME/.dotfiles

dotfiles checkout
if [ $? = 0 ]; then
  echo "dotfiles checked out"
else
  echo "backing up existing dotfiles"
  mkdir -p .dotfiles-backup
  dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -l{} mv {} .dotfiles-backup/{}
fi
dotfiles checkout
dotfiles config status.showUntrackedFiles no
dotfiles submodule init
dotfiles submodule update
echo "dotfiles submodules installed"
~/.fzf/install

echo "dotfiles installed"
