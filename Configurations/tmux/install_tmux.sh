#!/bin/bash

repo=$HOME/repos/salorak-config-files/Configurations/tmux
# Run as root
 
if [[ $EUID != 0 ]];
then
	echo "Script must be run as root."
	exit 1;
fi
 
 
## Check if tmux is installed
 
if [[ ! $(dpkg-query -l tmux) ]];
then
	echo ":: Installing tmux via apt ::"
	apt-get install tmux -y
fi
 
 
if [[ -e "/etc/tmux.conf" ]]
then
	echo "<<? Do you want to override configuration? ??? [y/N]"
	read -r input
	case $input in
		Y | y | yes | Yes | YES)
			echo "<< Overriding tmux.conf configuration >>"
			rm /etc/tmux.conf
			ln -s $repo/tmux/tmux.conf /etc/tmux.conf
			;;
		*)
			echo "<<! Exiting tmux configuration !>>"
			exit 0;
			;;
	esac
else
	ln -s $repo/tmux.conf /etc/tmux.conf
fi
 
echo "<< Sourcing tmux.conf >>"
source /etc/tmux.conf &>/dev/null
 
echo ":: TMUX installation completed ::"
exit 0
