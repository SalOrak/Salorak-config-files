#!/bin/bash

repo=$HOME/repos/salorak-config-files/Configurations/nvim_lua

# Change location to run correctly
# https://askubuntu.com/questions/1403337/download-is-performed-unsandboxed-as-root-as-file/1416892#1416892

#wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb 
#mv nvim-linux64.deb /tmp/nvim-linux64.deb

# Before installing make sure nvim is not installed
# sudo apt-get purge neovim
#sudo apt-get --quiet install /tmp/./nvim-linux64.deb
#rm /tmp/nvim-linux64.deb

echo "[NVIM-LUA] << Starting NVIM-LUA installation >>"
echo "[NVIM-LUA] << Downloading latest nvim.appimage release ..>>"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
mkdir -p $repo/binaries/
if [[ -e nvim.appimage ]];
then
    echo "[NVIM-LUA] << Downloaded completed. Linking nvim to /usr/bin/nvim >>"
    mv nvim.appimage $repo/binaries/nvim
    chmod u+x $repo/binaries/nvim
    sudo ln -f -s $repo/binaries/nvim /usr/bin/nvim

else
    echo "[NVIM-LUA] << Error while downloading. Using binary nvim v0.9.0 as binary and linking to /usr/bin/nvim >>"
    sudo ln -f -s $repo/binaries/nvim_0_9_0.appimage /usr/bin/nvim
fi

# Install python3 with pynvim
echo "[NVIM-LUA] << Installing python3, python3-pip and pynvim >>" 
sudo apt-get --quiet install python3 -y
sudo apt-get --quiet install python3-pip -y
python3 -m pip install --upgrade pip
pip3 install pynvim 

# Install ripgrep
echo "[NVIM-LUA] << Installing ripgrep via apt >>" 
sudo apt-get --quiet install ripgrep -y

# Install packer
echo "[NVIM-LUA] << Installing packer.nvim >>" 

if [[ -d "~/.local/share/nvim/site/pack/packer/start/packer.nvim/" ]];
then
    rm -rf /home/user/.local/share/nvim/site/pack/packer/start/packer.nvim/
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "[NVIM-LUA] << Packer has been installed >>"

echo "[NVIM-LUA] << Creating config directories and linking>>"
mkdir -p ~/.config/nvim
ln -f -s $repo/* ~/.config/nvim/


echo "[NVIM-LUA] << PackerSync started >>"
nvim -c 'PackerSync' -c 'q!' -c 'q!'
echo "[NVIM-LUA] << Finished NVIM-LUA installation >>"

