#!/bin/bash

repo=$HOME/repos/salorak-config-files/Configurations/tmux
 
 
## Check if tmux is installed
 
if [[ ! $(dpkg-query -l tmux) ]];
then
	echo ":: Installing tmux via apt ::"
	sudo apt-get install tmux -y
fi
 
 
if [[ -e "$HOME/.tmux.conf" ]]
then
	echo "<<? Do you want to override configuration? ??? [y/N]"
	read -r input
	case $input in
		Y | y | yes | Yes | YES)
			echo "<< Overriding tmux.conf configuration >>"
			rm $HOME/.tmux.conf
			ln -s $repo/tmux/tmux.conf $HOME/.tmux.conf
			;;
		*)
			echo "<<! Exiting tmux configuration !>>"
			exit 0;
			;;
	esac
else
	ln -s $repo/tmux.conf $HOME/.tmux.conf
fi
 
echo "<< Sourcing tmux.conf >>"
source $HOME/.tmux.conf &>/dev/null
 
echo ":: TMUX installation completed ::"
exit 0
