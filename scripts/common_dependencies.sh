#!/bin/bash

# Nodejs and Yarn
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get -y -qq update

# Deps
sudo apt install -y software-properties-common apt-transport-https git curl wget \
    simplescreenrecorder nload gnome-tweaks chrome-gnome-shell gnome-shell-extensions \
    automake cmake g++ gcc pkg-config unzip build-essential xclip stow \
    ccls ctags nodejs yarn global clangd ninja-build gettext libtool \
    libtool-bin autoconf clang-format node-js-beautify

# Python dev deps
pip3 install 'python-lsp-server[all]'

# Bash dev deps
sudo npm i -g bash-language-server lua-fmt

# Tex deps
sudo apt install -y texlive-latex-extra texlive-extra-utils texmaker

# Python deps
pip3 install lookatme
pip3 install lookatme.contrib.qrcode lookatme.contrib.image-ueberzug lookatme.contrib.render

# Ranger
sudo apt install -y ranger caca-utils highlight atool w3m poppler-utils mediainfo lynx ffmpegthumbnailer

# Nvim deps
sudo apt install -y lua-nvim python3-neovim python3-venv zsh fzf ripgrep ueberzug

# Tmux deps...
sudo apt install tmux fonts-powerline
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Alacritty
sudo add-apt-repository -y ppa:mmstick76/alacritty
sudo apt install -y alacritty
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 60
