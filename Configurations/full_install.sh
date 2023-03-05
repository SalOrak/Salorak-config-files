#!/bin/bash


# dconf installation
echo "[DCONF] Adding dconf.."
sudo apt-get update && sudo apt-get install dconf -y
cat dconf/dcon-settings.ini | dconf load /

# fonts installation
echo "[FONTS] Installing fonts"
./fonts/install_fonts.sh

# latexmk installation
echo "[LATEXMK] Installing latexmk"
./latexmk/install_latexmk.sh

# rust installation
echo "[RUST] Installing rust"
./rust/install_rust.sh

# alacritty installation
echo "[ALACRITTY] Installing alacritty"
./terminal/install_terminal.sh

# tmux installation
echo "[TMUX] Installing tmux"
./tmux/install_tmux.sh

# nvim installation
echo "[NVIM] Installing nvim"
./nvim/install_nvim.sh

# xfce4 shortcuts
echo "[XFCE4] Adding xfce4 shortcuts"
rm $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
ln -s $(pwd)/xfce4/xfce4-keyboard-shortcuts.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml






