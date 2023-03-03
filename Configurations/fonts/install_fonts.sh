#!/bin/bash

echo "<<! Creating mono directory inside /usr/share/fonts >>"
# Create mono directory inside fonts
sudo mkdir -p /usr/share/fonts/mono

# Copy all fonts inside such directory
echo "<<! Copying all fonts... >>"
sudo cp -R Inconsolata/ /usr/share/fonts/mono/


# Update the font cache
echo "<<! Updating the font cache >>"
sudo fc-cache -f -v 


