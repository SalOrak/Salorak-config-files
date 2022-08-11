# Kali Linux 2022 builder
# It only works with xfce4 desktop 
# Only works with root


# Check if it's running root                                                                                          
if [ "$EUID" -ne 0 ]                                                                                                  
	  then echo "Please run as root"
		    exit 1                                                   
fi 

# Setting up repositories
echo "Setting up directories..."
mkdir /home/$USER/repos/

## Downloading process
# Git clone config files
echo "Cloning git config repository..."
git clone -q https://github.com/SalOrak/Salorak-config-files /home/$USER/repos/

# Downloading Obsidian.AppImage 0.15.9 (10/08/2022)
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.15.9/Obsidian-0.15.9.AppImage -O /home/$USER/Documents/Obsidian.AppImage
echo "Adding permisions to Obsidian..."
chmod +x /home/$USER/Documents/Obsidian.AppImage

## Installation phase
#...

## Configutarion phase

# tmux
echo "Setting up tmux configuration..."
cp /home/$USER/repos/Salorak-config-files/tmux/tmux.conf /etc/tmux.conf

# xfce4 
echo "Changing keyboard shortcuts..."
mv /home/$USER/.config/xfce4/xfconf/xfce-perchannel/xml/xfce4-keyboard-shortcuts.xml /home/$USER/.config/xfce4/xfconf/xfce-perchannel/xml/xfce4-keyboard-shortcuts-default.xml
cp /home/$USER/repos/Salorak-config-files/xfce4/xfce4-keyboard-shortcuts.xml /home/$USER/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

## Change wallpaper
echo "Changing wallpaper"
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s /usr/share/backgrounds/kali-16x9/kali-ascii.png

echo ""
echo "Kali Linux Setup done ;) Enjoy!"
