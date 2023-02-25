#!/bin/bash 
 
# Install latexmk ( Latex cross-files compilation) 
if [[ ! $(dpkg-query -l "latexmk") ]];
then
	echo "<<! Installing latexmk... !>>"
	sudo apt-get install latexmk -y
	sudo apt-get install texlive-luatex -y # Installs dependencies not found on certain distros such as Debian
else
	echo "<<! Found latexmk package... !>>"
	echo "<<! Skipping latexmk installation... !>>"
fi

# Install zathura ( PDF viewer among others)
if [[ ! $(dpkg-query -l "zathura") ]];
then
	echo "<<! Installing zathura.. !>>"
	sudo apt-get install zathura -y 
fi

## Link latexmkrc file
echo "<< Soft link latexmkrc configuration ?>>"
mkdir -p ~/.config/latexmk/
if [[ -e "$HOME/.config/latexmk/.latexmkrc" || -h "$HOME/.config/latexmk/.latexmkrc" ]];
then
	echo "<<?? Do you want to override configuration??>>  [y/N]"
	read -r -n 1 input
		printf "\n"
	case $input in
		Y | y | yes | Yes | YES )
			echo "<< Overriding latexmk configuration >>"
			rm $HOME/.config/latexmk/.latexmkrc
			ln -s $(pwd)/latexmkrc $HOME/.config/latexmk/.latexmkrc
			;;
		*)
		echo "<<! Exiting latexmk configuration. !>>"	
		exit 0;
	esac
 
else
	ln -s $(pwd)/latemkrc $HOME/.config/latexmk/.latexmkrc
fi

echo ":: LATEX installation completed ::"
exit 0
