#!/bin/bash 
 
## Install nvim
if [[ ! $(dpkg-query -l "neovim") ]];
then
	echo "<<! Installing neovim... !>>"
	sudo apt-get install neovim -y
else
	echo "<<! Found neovim package... !>>"
	echo "<<! Skipping neovim installation... !>>"
fi

# Install latexmk
if [[ ! $(dpkg-query -l "  latexmk") ]];
then
	echo "<<! Installing latexmk... !>>"
	sudo apt-get install latexmk -y
	sudo apt-get install texlive-luatex -y # Installs dependencies not found on certain distros such as Debian
else
	echo "<<! Found latexmk package... !>>"
	echo "<<! Skipping latexmk installation... !>>"
fi

## Install Vim-Plug
echo "<< Installing Vim-Plug ?>>"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 
 
## Link nvim init file
echo "<< Soft link nvim init configuration ?>>"
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/ftplugin
if [[ -e "$HOME/.config/nvim/init.vim" || -h "$HOME/.config/nvim/init.vim" ]];
then
	echo "<<?? Do you want to override configuration??>>  [y/N]"
	read -r -n 1 input
		printf "\n"
	case $input in
		Y | y | yes | Yes | YES )
			echo "<< Overriding nvim init configuration >>"
			rm $HOME/.config/nvim/init.vim
			ln -s $(pwd)/init.vim $HOME/.config/nvim/init.vim
			;;
		*)
		echo "<<! Exiting nvim configuration. !>>"	
		exit 0;
	esac
 
else
	ln -s $(pwd)/init.vim $HOME/.config/nvim/init.vim
	ln -s $(pwd)/ftplugin/tex.vim $HOME/.config/nvim/ftplugin/tex.vim
fi
 
 
 
## Execute Vim-Plug installation and Quit
echo "<< Installing vim plugins ?>>"
nvim -c 'PlugInstall' -c 'q!' -c 'q!' 
 
 
## Add alias to nvim
echo -e "<< Adding aliases to nvim ?>>"
if [[ ! $(cat ~/.bash_aliases | grep "alias vi") ]];
then
	touch $HOME/.bash_aliases
	echo -e 'alias vi="nvim"\nalias vim="nvim"' >> $HOME/.bash_aliases
else
	echo "<<! Found vi stablished aliases !>>"
	echo "<<! Skipping adding aliases !>>"
fi
 
echo ":: NVIM installation completed ::"
exit 0
