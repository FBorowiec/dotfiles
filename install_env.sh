#!/bin/bash

# Shell script for installing my ws env

# Beautify logs
CHECK_MARK="\033[0;32m\u2713"
ERROR_MARK="\033[0;31m\u2717"

echo -e "Upgrading the system..."
sudo apt -y -qq update
sudo apt -y -qq upgrade
echo -e "$CHECK_MARK \e[1mUpgrading system succeeded!\e[0m\e[32m\e[39m"

echo -e "Installing dependencies..."
sudo apt install -y software-properties-common apt-transport-https wget git curl wget \
    simplescreenrecorder nload gnome-tweaks chrome-gnome-shell gnome-shell-extensions \
    python3-neovim pynvim python3-venv zsh fzf ripgrep terminator tmux ccls ctags nodejs \
    npm global clangd lua5.1 lua-nvim ninja-build gettext libtool libtool-bin autoconf \
    automake cmake g++ pkg-config unzip # neovim
sudo npm install -g yarn && yarn --registry "https://registry.npmjs.org"
pip3 install -U jedi-language-server
echo -e "$CHECK_MARK \e[1mInstalling dependecies succeeded!\e[0m\e[32m\e[39m"

cd && git clone https://github.com/neovim/neovim.git && cd neovim && make && sudo make install

# Exit on success
echo -e "$CHECK_MARK \e[1mScript execution succeeded!\e[0m\e[32m\e[39m"
