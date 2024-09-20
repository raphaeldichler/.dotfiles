#!/bin/bash

set -x

if [ -z ${SUDO_USER} ]; then
    PROFILE=$USER
else
    PROFILE=$SUDO_USER
fi

apt-get update && apt-get upgrade -y

# install specified software
while read package; do
  apt-get install -y $package
done < software-list.txt

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
rm -f nvim-linux64.tar.gz

rm -rf $HOME/.local/share/nvim/site/pack/packer/
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir -p $HOME/.config
cp -r ./.config $HOME

cp ./.bashrc $HOME/.bashrc
cp ./.bash_aliases $HOME/.bash_aliases
cp ./tmux.conf $HOME/tmux.conf

chown $PROFILE:$PROFILE -R $HOME
source $HOME/.bashrc

export PATH=$PATH:/opt/nvim-linux64/bin
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "Setup complete"
echo "Reopen terminal or run source ~/.bashrc"
