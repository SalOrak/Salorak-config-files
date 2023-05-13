#!/bin/bash

repo=$HOME/repos/salorak-config-files/Configurations/tmux
 
 
echo "[TMUX] << TMUX installation started >>" 
## Check if tmux is installed
if [[ ! $(dpkg-query -l tmux) ]];
then
	echo "[TMUX] << Installing tmux via apt >>" 
	sudo apt-get --quiet install tmux -y
fi
 
 
if [[ -e "$HOME/.tmux.conf" ]]
then
	echo "[TMUX] <<? Do you want to override configuration? ??? [y/N]"
	read -r input
	case $input in
		Y | y | yes | Yes | YES)
			echo "[TMUX] << Overriding tmux.conf configuration >>"
			rm $HOME/.tmux.conf
			ln -s $repo/tmux/tmux.conf $HOME/.tmux.conf
			;;
		*)
			echo "[TMUX] <<! Exiting tmux configuration !>>"
			exit 0;
			;;
	esac
else
	ln -s $repo/tmux.conf $HOME/.tmux.conf
fi
 
echo "[TMUX] << Sourcing tmux.conf >>"
source $HOME/.tmux.conf &>/dev/null

if [[ $(cat ~/.bash_aliases | grep tmux) -ge 1 ]];
then
    echo "[TMUX] << Adding alias on .bash_aliases >>"
    echo "alias t=tmux" >> ~/.bash_aliases
fi
 
echo "[TMUX] << TMUX installation completed >>" 
