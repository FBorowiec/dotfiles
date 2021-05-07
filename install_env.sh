#!/bin/bash
# Shell script for installing my ws env

# Beautify logs
CHECK_MARK="\033[0;32m\u2713"
ERROR_MARK="\033[0;31m\u2717"

# Check if script executed with sudo
echo -e "  Checking execution rights...\n"
[ `whoami` = root ] || { echo -e "$ERROR_MARK Failed to run script as sudo!"; exit; }

echo -e "Upgrading the system..."
sudo apt -y -qq update
sudo apt -y -qq upgrade
echo -e "$CHECK_MARK \e[1mUpgrading system succeeded!\e[0m\e[32m\e[39m"

echo -e "Installing dependencies..."
sudo apt install -y software-properties-common apt-transport-https wget git curl wget simplescreenrecorder nload gnome-tweaks chrome-gnome-shell gnome-shell-extensions vim zsh terminator
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
echo -e "$CHECK_MARK \e[1mInstalling dependecies succeeded!\e[0m\e[32m\e[39m"

sudo wget -q https://wallpapercave.com/download/star-wars-last-supper-wallpaper-wp2982200?nocache=1 -O /usr/share/backgrounds/start_wars_last_supper.jpg

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

echo -e "Updating zshell..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && exit
sed -i 's/ZSH_THEME=.*/ZSH_THEME="murilasso"/' ${HOME}/.zshrc
sed -i 's/plugins=(.*)/plugins=(bazel docker docker-compose docker-machine git zsh-navigation-tools)/' ${HOME}/.zshrc
sudo chmod 744 ${HOME}/.oh-my-zsh
sudo chmod 744 ${HOME}/.zshrc*

# Exit on success
echo -e "$CHECK_MARK \e[1mScript execution succeeded!\e[0m\e[32m\e[39m"
