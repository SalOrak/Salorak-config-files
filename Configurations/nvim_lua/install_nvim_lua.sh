#!/bin/bash

# Change location to run correctly
# https://askubuntu.com/questions/1403337/download-is-performed-unsandboxed-as-root-as-file/1416892#1416892
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb 
mv nvim-linux64.deb /tmp/nvim-linux64.deb

# Before installing make sure nvim is not installed
# sudo apt-get purge neovim
sudo apt-get install /tmp/./nvim-linux64.deb
rm /tmp/nvim-linux64.deb

# Install tools necessary (xclip)
sudo apt-get install xclip -y

# Install python3 with pynvim
sudo apt-get install python3 -y
python3 -m pip install --upgrade pip
pip3 install pynvim 

# Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim -c 'PackerSync' -c 'q!' -c 'q!'

ln -s $(pwd)/* ~/.config/nvim/
