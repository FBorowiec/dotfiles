#!/bin/bash

# Beautify logs
CHECK_MARK="\033[0;32m\u2713"
ERROR_MARK="\033[0;31m\u2717"

# Check if script executed with sudo
echo -e "  Checking execution rights...\n"
[ `whoami` = root ] || { echo -e "$ERROR_MARK Failed to run script as sudo!"; exit; }

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

# Exit on success
echo -e "$CHECK_MARK \e[1mScript execution succeeded!\e[0m\e[32m\e[39m"
