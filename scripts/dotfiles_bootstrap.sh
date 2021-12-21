#!/bin/bash

# Installing alacritty config
ln -s $PWD/.config/alacritty ~/.config/alacritty

# Installing terminator config
ln -s $PWD/.config/terminator ~/.config/terminator

# Installing Nvim
ln -s $PWD/.config/nvim ~/.config/nvim

# Installing Ranger
ln -s $PWD/.config/ranger ~/.config/ranger

# Configuring Powerlevel10k and Zsh
ln -s $PWD/.p10k.zsh ~/.p10k.zsh
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.inputrc ~/.inputrc

# Git config
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.config/gitignore ~/.config/gitignore

# Tmux config
ln -s $PWD/.tmux.conf ~/.tmux.conf

# Cheatsheet
ln -s $PWD/.config/cht.sh ~/.config/cht.sh
ln -s $PWD/.config/znt-tmux.sh ~/.config/znt-tmux.sh

# Mutt config
ln -s $PWD/.mutt ~/.mutt

