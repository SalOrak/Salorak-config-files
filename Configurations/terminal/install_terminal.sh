#!/bin/bash
repo=$HOME/repos/salorak-config-files/Configurations/terminal

echo "[ALACRITTY] <<! Alacritty installation started >>"
echo "[ALACRITTY] <<! Installing (& building) alacritty terminal ..>>"

# Install dependencies
echo "[ALACRITTY] <<! Installing dependencies..>>"
sudo apt-get --quiet update
sudo apt-get --quiet install gzip git cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y

# Git clone
echo "[ALACRITTY] <<! Cloning github repository..>>"
if [[ ! -d alacritty ]];
then
    git clone https://github.com/alacritty/alacritty.git
fi

# Build alacritty
echo "[ALACRITTY] <<! Building alacritty ..>>"
cd alacritty/
source $HOME/.cargo/env
cargo build --release

# Adding to path (/usr/local/bin)
echo "[ALACRITTY] <<! Adding alacritty to /usr/local/bin !>>"
if [[ -e /usr/local/bin/alacritty ]];
then
    echo "[ALACRITTY] <<! Old Alacritty binary removed it!>>"
    sudo rm /usr/local/bin/alacritty 
fi
sudo cp target/release/alacritty /usr/local/bin/alacritty

# Installing the man page
echo "[ALACRITTY] <<! Installing the manual page ..>>"
sudo mkdir -p /usr/local/share/man/man1

gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

# Removing Github Repository
echo "[ALACRITTY] <<! Removing git repo ..!>>"
cd ..
if [[ -d alacritty ]];
then
    rm -rf alacritty
fi

# Install configuration theme for alacrity
mkdir -p ~/.config/alacritty/themes
if [[ ! -d ~/.config/alacritty/themes ]];
then
    echo "[ALACRITTY] <<! Cloning repository of alacritty themes ..>>"
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
else
    echo "[ALACRITTY] <<! Skipping clone. Alacritty themes repository found..>>"
fi



# link soft alacritty.yml
echo "[ALACRITTY] <<! Soft link alacritty.yml ..>>"
ln -f -s  $(repo)/alacritty.yml $HOME/.config/alacritty/alacritty.yml

echo "[ALACRITTY] <<! Alacritty installation finished >>"
