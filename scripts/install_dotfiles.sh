#!/bin/bash

# Installing alacritty config
ln -s $PWD/alacritty ~/.config/alacritty

# Installing terminator config
ln -s $PWD/terminator ~/.config/terminator

# Installing NVim
ln -s $PWD/nvim ~/.config/nvim

# Configuring Powerlevel10k and Zsh
ln -s $PWD/zsh/p10k.zsh ~/.p10k.zsh
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/zsh/inputrc ~/.inputrc

# Git config
ln -s $PWD/git/gitconfig ~/.gitconfig
ln -s $PWD/git/gitignore ~/.config/gitignore

# Tmux config
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf
