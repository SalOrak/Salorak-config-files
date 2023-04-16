#!/bin/bash
repo=$HOME/repos/salorak-config-files/Configurations/fonts

echo "[FONTS] <<! Font installation started >>"
echo "[FONTS] <<! Creating mono directory inside /usr/share/fonts >>"
# Create mono directory inside fonts
sudo mkdir -p /usr/share/fonts/mono

# Copy all fonts inside such directory
if [[ ! -d /usr/share/fonts/mono/Inconsolata ]];
then
    echo "[FONTS] <<! Copying all fonts... >>"
    sudo cp -R $repo/Inconsolata/ /usr/share/fonts/mono/
else
    echo "[FONTS] <<! Skipping font copy. Fonts already exist on the system.>>"
fi

# Update the font cache
echo "[FONTS] <<! Updating the font cache >>"
sudo fc-cache -f -v 

echo "[FONTS] <<! Font installation finished >>"

