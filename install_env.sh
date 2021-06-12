#!/bin/bash
# Shell script for installing my ws env

# Beautify logs
CHECK_MARK="\033[0;32m\u2713"
ERROR_MARK="\033[0;31m\u2717"

# Check if script executed with sudo
echo -e "  Checking execution rights...\n"
[ $(whoami) = root ] || {
    echo -e "$ERROR_MARK Failed to run script as sudo!"
    exit
}

echo -e "Upgrading the system..."
sudo apt -y -qq update
sudo apt -y -qq upgrade
echo -e "$CHECK_MARK \e[1mUpgrading system succeeded!\e[0m\e[32m\e[39m"

echo -e "Installing dependencies..."
sudo apt install -y software-properties-common apt-transport-https wget git curl wget \
    simplescreenrecorder nload gnome-tweaks chrome-gnome-shell gnome-shell-extensions \
    neovim python3-neovim zsh fzf terminator tmux
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
echo -e "$CHECK_MARK \e[1mInstalling dependecies succeeded!\e[0m\e[32m\e[39m"

echo -e "Updating zshell..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && exit
sudo chmod 744 ${HOME}/.oh-my-zsh
sudo chmod 744 ${HOME}/.zshrc*

# Installing powerlevel10k
echo -e "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k/powerlevel10k"/' ${HOME}/.zshrc
sed -i 's/plugins=(.*)/plugins=(bazel docker docker-compose docker-machine git zsh-autosuggestions zsh-navigation-tools)/' ${HOME}/.zshrc

# Exit on success
echo -e "$CHECK_MARK \e[1mScript execution succeeded!\e[0m\e[32m\e[39m"
