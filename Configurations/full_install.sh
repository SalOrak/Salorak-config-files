#!/bin/bash


# dconf installation
echo "[DCONF] Adding dconf.."
cat dconf/dcon-settings.ini | dconf load /

# fonts installation
echo "[FONTS] Installing fonts"
./$(pwd)/fonts/install_fonts.sh

# latexmk installation
echo "[LATEXMK] Installing latexmk"
./$(pwd)/latexmk/install_latexmk.sh

# rust installation
echo "[RUST] Installing rust"
./$(pwd)/rust/install_rust.sh

# alacritty installation
echo "[ALACRITTY] Installing alacritty"
./$(pwd)/alacritty/install_terminal.sh

# tmux installation
echo "[TMUX] Installing tmux"
sudo ./$(pwd)/tmux/install_tmux.sh

# nvim installation
echo "[NVIM] Installing nvim"
sudo ./$(pwd)/nvim/install_nvim.sh

# xfce4 shortcuts
echo "[XFCE4] Adding xfce4 shortcuts"
ln -s $(pwd)/xfce4/xfce4-keyboard-shortcuts.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml






