#!/bin/bash

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

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

mkdir -p $HOME/.config
rm -rf $HOME/.config/nvim
cp -r nvim $HOME/.config

cp ./.bashrc $HOME/.bashrc
cp ./.bash_aliases $HOME/.bash_aliases
cp ./tmux.conf $HOME/tmux.conf

chown $PROFILE:$PROFILE -R $HOME
source $HOME/.bashrc

export PATH=$PATH:/opt/nvim-linux64/bin

# install golang
wget https://go.dev/dl/go1.24.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mkdir /usr/local/go
sudo tar -C /usr/local -xzf go1.24.0.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# tree-sitter dependency
sudo npm install -g tree-sitter-cli

# install lsp
./lsp/lua.sh
./lsp/golang.sh

echo "Setup complete"
echo "Reopen terminal or run source ~/.bashrc"
