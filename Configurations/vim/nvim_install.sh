#!/bin/bash 

## Install nvim

sudo apt-get install neovim -y

## Install Vim-Plug
echo "<< Installing Vim-Plug ?>>"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


## Link nvim init file
echo "<< Soft link nvim init configuration ?>>"
mkdir -p ~/.config/nvim
ln -s $HOME/repos/Salorak-config-files/Configuration/vim/init.vim $HOME/.config/nvim/init.vim

## Execute Vim-Plug installation and Quit
echo "<< Installing vim plugins ?>>"
nvim -c 'PlugInstall' -c 'q!' -c 'q!' 


## Add alias to nvim
echo -e "<< Adding aliases to nvim ?>>"
echo -e 'alias vi="nvim"\nalias vim="nvim"' >> $HOME/.bash_aliases

