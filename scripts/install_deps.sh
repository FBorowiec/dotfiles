#!/bin/bash

# Shell script for installing my ws env

# Beautify logs
CHECK_MARK="\033[0;32m\u2713"
ERROR_MARK="\033[0;31m\u2717"

echo -e "Installing dependencies..."
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get -y -qq update
sudo apt install -y software-properties-common apt-transport-https wget git curl wget \
    simplescreenrecorder nload gnome-tweaks chrome-gnome-shell gnome-shell-extensions \
    python3-neovim python3-venv zsh fzf ripgrep terminator tmux ccls ctags nodejs \
    yarn global clangd lua5.1 lua-nvim ninja-build gettext libtool libtool-bin autoconf \
    automake cmake g++ gcc pkg-config unzip build-essential xclip

echo -e "Installing tmux deps..."
sudo apt install fonts-powerline
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo apt -y -qq upgrade
echo -e "$CHECK_MARK \e[1mInstalling dependecies succeeded!\e[0m\e[32m\e[39m"

# Exit on success
echo -e "$CHECK_MARK \e[1mScript execution succeeded!\e[0m\e[32m\e[39m"
