#!/bin/bash 
repo=$HOME/repos/salorak-config-files/Configurations/latexmk 

echo "[LATEX] << LATEX installation started >>" 

# Install latexmk ( Latex cross-files compilation) 
if [[ ! $(dpkg-query -l "latexmk") ]];
then
	echo "[LATEX] <<! Installing latexmk... !>>"
	sudo apt-get --quiet install latexmk -y
	sudo apt-get --quiet install texlive-luatex -y # Installs dependencies not found on certain distros such as Debian
else
	echo "[LATEX] <<! Found latexmk package... !>>"
	echo "[LATEX] <<! Skipping latexmk installation... !>>"
fi

# Install zathura ( PDF viewer among others)
if [[ ! $(dpkg-query -l "zathura") ]];
then
	echo "[LATEX] <<! Installing zathura.. !>>"
	sudo apt-get --quiet install zathura -y 
else
	echo "[LATEX] <!! Found zathura ..!>>"
	echo "[LATEX] <!! Skipping zathura installation...!>>"
fi

## Link latexmkrc file
echo "[LATEX] << Soft link latexmkrc configuration ?>>"
mkdir -p ~/.config/latexmk/
if [[ -e "$HOME/.config/latexmk/latexmkrc" || -h "$HOME/.config/latexmk/latexmkrc" ]];
then
	echo "[LATEX] <<?? Do you want to override configuration??>>  [y/N]"
	read -r -n 1 input
		printf "\n"
	case $input in
		Y | y | yes | Yes | YES )
			echo "[LATEX] << Overriding latexmk configuration >>"
			rm $HOME/.config/latexmk/latexmkrc
			ln -s $repo/latexmkrc $HOME/.config/latexmk/latexmkrc
			;;
		*)
		echo "[LATEX] <<! Exiting latexmk configuration. !>>"	
		exit 0;
	esac
 
else
	ln -s $repo/latexmkrc $HOME/.config/latexmk/latexmkrc
fi

echo "[LATEX] << LATEX installation finished >>" 
