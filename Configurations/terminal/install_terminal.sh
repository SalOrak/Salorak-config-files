#!/bin/bash
repo=$HOME/repos/salorak-config-files/Configurations/terminal

echo "<<! Installing (& building) alacritty terminal ..>>"

# Install dependencies
echo "<<! Installing dependencies..>>"
sudo apt-get update
sudo apt-get install gzip git cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y

# Git clone
echo "<<! Cloning github repository..>>"
git clone https://github.com/alacritty/alacritty.git

# Build alacritty
echo "<<! Building alacritty ..>>"
cd alacritty/
source $HOME/.cargo/env
cargo build --release

# Adding to path (/usr/local/bin)
echo "<<! Adding alacritty to /usr/local/bin !>>"
sudo cp target/release/alacritty /usr/local/bin

# Installing the man page
echo "<<! Installing the manual page ..>>"
sudo mkdir -p /usr/local/share/man/man1

gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

# Removing Github Repository
echo "<<! Removing git repo ..!>>"
cd ..
rm -rf alacritty


# Install configuration theme for alacrity
echo "<<! Cloning repository of alacritty themes ..>>"
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes


# link soft alacritty.yml
echo "<<! Soft link alacritty.yml ..>>"
ln -s  $repo/alacritty.yml $HOME/.config/alacritty/alacritty.yml
