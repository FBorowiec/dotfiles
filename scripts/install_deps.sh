#!/bin/bash

# Nodejs and Yarn
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get -y -qq update

# deps
sudo apt install -y software-properties-common apt-transport-https git curl wget \
    simplescreenrecorder nload gnome-tweaks chrome-gnome-shell gnome-shell-extensions \
    automake cmake g++ gcc pkg-config unzip build-essential xclip stow \
    ccls ctags nodejs yarn global clangd ninja-build gettext libtool \
    libtool-bin autoconf clang-format \

# nvim deps
sudo apt install -y lua-nvim python3-neovim python3-venv zsh fzf ripgrep ranger

# tmux deps...
sudo apt install tmux fonts-powerline
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# alacritty
sudo add-apt-repository -y ppa:mmstick76/alacritty
sudo apt install -y alacritty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 60
