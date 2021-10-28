#!/bin/bash

# Installing alacritty config
ln -s $PWD/alacritty ~/.config/alacritty

# Installing terminator config
ln -s $PWD/terminator ~/.config/terminator

# Installing Nvim
ln -s $PWD/nvim ~/.config/nvim

# Installing Ranger
ln -s $PWD/ranger ~/.config/ranger

# Configuring Powerlevel10k and Zsh
ln -s $PWD/zsh/p10k.zsh ~/.p10k.zsh
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/zsh/inputrc ~/.inputrc

# Git config
ln -s $PWD/git/gitconfig ~/.gitconfig
ln -s $PWD/git/gitignore ~/.config/gitignore

# Tmux config
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf

# Cheatsheet
ln -s $PWD/scripts/cht.sh ~/.config/cht.sh

# Mutt config
ln -s $PWD/mutt ~/.mutt

