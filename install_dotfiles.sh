#!/bin/bash

echo -e "Configuring dotfiles..."
# Installing terminator config
mkdir -p ~/.config/terminator/
cp terminator/config ~/.config/terminator/config

# Installing NVim
cp -r nvim ~/.config/nvim

# Configuring Powerlevel10k and Zsh
cp zsh/p10k.zsh ~/.p10k.zsh
cp zsh/zshrc ~/.zshrc
cp zsh/inputrc ~/.inputrc

# git config
cp git/gitconfig ~/.gitconfig

# Tmux config
cp tmux/tmux.conf ~/.tmux.conf
