#!/bin/bash 
 
repo=$HOME/repos/salorak-config-files/Configurations/nvim
## Install nvim
echo "<<! Installing neovim... !>>"
sudo apt-get install neovim -y

## Install fd (for fast find)
if [[ !$(dpkg-query -l "fdfind") ]];
then
	# https://github.com/sharkdp/fd#installation
	echo "<<! Installing fdfing..!>>"
	sudo apt-get install fd-find
	mkdir -p $HOME/.local/bin/fd
	source ~/.profile
	ln -s $(which fdfind) ~/.local/bin/fd
else
	echo "<<! Found fdfind package..!>>"
	echo "<<! Skipping fdfind installation..!>>"
fi

## Install ripgrep ( line-oriented search tool that recursively searches the current dir for a reg pattern.
if [[ !$(dpkg-query -l "ripgrep") ]];
then
	## https://github.com/BurntSushi/ripgrep#installation
	echo "<<! Installing ripgrep..!>>"
	sudo apt-get install ripgrep
else
	echo "<<! Found ripgrep package..!>>"
	echo "<<! Skipping ripgrep installation..!>>"
fi

## Install Vim-Plug
echo "<< Installing Vim-Plug ?>>"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 
 
## Link nvim init file
echo "<< Soft link nvim init configuration ?>>"
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/ftplugin
mkdir -p ~/.config/nvim/my_snippets
if [[ -e "$HOME/.config/nvim/init.vim" || -h "$HOME/.config/nvim/init.vim" ]];
then
	echo "<<?? Do you want to override configuration??>>  [y/N]"
	read -r -n 1 input
		printf "\n"
	case $input in
		Y | y | yes | Yes | YES )
			echo "<< Overriding nvim init configuration >>"
			rm $HOME/.config/nvim/init.vim
			rm $HOME/.config/nvim/ftplugin/tex.vim
			ln -s $repo/init.vim $HOME/.config/nvim/init.vim
			ln -s $repo/ftplugin/tex.vim $HOME/.config/nvim/ftplugin/tex.vim
			cp $repo/my_snippets/* $HOME/.config/nvim/my_snippets/
			;;
		*)
		echo "<<! Exiting nvim configuration. !>>"	
		exit 0;
	esac
 
else
	ln -s $repo/init.vim $HOME/.config/nvim/init.vim
	ln -s $repo/ftplugin/tex.vim $HOME/.config/nvim/ftplugin/tex.vim
	cp $repo/my_snippets/* $HOME/.config/nvim/my_snippets/
fi
 
 
## Execute Vim-Plug installation and Quit
echo "<< Installing vim plugins ?>>"
nvim -c 'PlugInstall' -c 'q!' -c 'q!' 
 
 
## Add alias to nvim
echo -e "<< Adding aliases to nvim ?>>"
touch $HOME/.bash_aliases

if [[ !$(cat $HOME/.bash_aliases | grep "alias vi") ]];
then
	echo -e 'alias vi="nvim"\nalias vim="nvim"' >> $HOME/.bash_aliases
else
	echo "<<! Found vi stablished aliases !>>"
	echo "<<! Skipping adding aliases !>>"
fi
 
echo ":: NVIM installation completed ::"
exit 0
