#!/bin/bash


# dconf installation
echo "[DCONF] Adding dconf.."
cat dconf/dcon-settings.ini | dconf load /

# fonts installation
echo "[FONTS] Installing fonts"
cd fonts 
./install_fonts.sh
cd ..


# latexmk installation
echo "[LATEXMK] Installing latexmk"
cd latexmk 
./install_latexmk.sh
cd ..

# rust installation
echo "[RUST] Installing rust"
cd rust 
./install_rust.sh
cd ..

# alacritty installation
echo "[ALACRITTY] Installing alacritty"
cd terminal 
./install_terminal.sh
cd ..

# tmux installation
echo "[TMUX] Installing tmux"
cd tmux 
sudo ./install_tmux.sh
cd ..

# nvim installation
echo "[NVIM] Installing nvim"
cd nvim
sudo ./install_nvim.sh
cd ..

# xfce4 shortcuts
echo "[XFCE4] Adding xfce4 shortcuts"
ln -s $(pwd)/xfce4/xfce4-keyboard-shortcuts.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml






