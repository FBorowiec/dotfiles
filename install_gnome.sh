#!/bin/bash

# Beautify logs
CHECK_MARK="\033[0;32m\u2713"
ERROR_MARK="\033[0;31m\u2717"

# Check if script executed with sudo
echo -e "  Checking execution rights...\n"
[ $(whoami) = root ] || {
    echo -e "$ERROR_MARK Failed to run script as sudo!"
    exit
}

echo -e "Downloading gnome themes..."
wget -q https://github.com/daniruiz/flat-remix-gnome/archive/master.zip -O ${HOME}/Downloads/flat-remix-gnome-master.zip #gnome
echo -e "Downloading gtk themes..."
wget -q https://github.com/daniruiz/flat-remix-gtk/archive/master.zip -O ${HOME}/Downloads/flat-remix-gtk-master.zip #gtk
echo -e "Downloading icons themes..."
wget -q https://github.com/daniruiz/flat-remix/archive/master.zip -O ${HOME}/Downloads/flat-remix-master.zip #icons

echo -e "Unzipping themes..."
unzip -qq ${HOME}/Downloads/flat-remix-gnome-master.zip -d ${HOME}/Downloads
unzip -qq ${HOME}/Downloads/flat-remix-gtk-master.zip -d ${HOME}/Downloads
unzip -qq ${HOME}/Downloads/flat-remix-master.zip -d ${HOME}/Downloads

echo -e "Removing existing configuration..."
if [ -f " ${HOME}/.icons" ]; then
    sudo rm -rf ${HOME}/.icons/*
else
    sudo mkdir ${HOME}/.icons
fi

if [ -f "${HOME}/.themes" ]; then
    sudo rm -rf ${HOME}/.themes/*
else
    sudo mkdir ${HOME}/.themes
fi

echo -e "Moving themes..."
sudo mv ${HOME}/Downloads/flat-remix-gnome-master/Flat-Remix-* ${HOME}/.themes
sudo mv ${HOME}/Downloads/flat-remix-gtk-master/Flat-Remix-* ${HOME}/.themes
sudo mv ${HOME}/Downloads/flat-remix-master/Flat-Remix-* ${HOME}/.icons
#sudo rm -rf ${HOME}/Downloads/flat*

sudo wget -q https://coolwallpapers.me/picsup/2873215-darth-vader-emperor-palpatine-stormtrooper-star-wars-the-last-supper___movie-wallpapers.jpg -O /usr/share/backgrounds/start_wars_last_supper.jpg

gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/start_wars_last_supper.jpg'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.0
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-Black"
gsettings set org.gnome.desktop.wm.preferences button-layout close,minimize,maximize:

gsettings set org.gnome.shell.extensions.user-theme name "Flat-Remix-Red-Dark-fullPanel"
gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK-Red-Dark-Solid"
gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix-Red-Dark"

# Exit on success
echo -e "$CHECK_MARK \e[1mScript execution succeeded!\e[0m\e[32m\e[39m"
