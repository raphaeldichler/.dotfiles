#!/bin/bash

apt-get update && apt-get upgrade -y

# install specified software
while read package; do
  apt-get install -y $package
done < software-list.txt

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
rm -f nvim-linux64.tar.gz

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir ~/.config
cp -r ./.config ~/.config/

cp ./.bashrc ~/.bashrc
cp ./.bash_aliases ~/.bash_aliases


