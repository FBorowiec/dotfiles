#!/bin/bash

# Installing terminator config
echo "Configuring terminator..."
mkdir -p ~/.config/terminator/
cp terminator/config ~/.config/terminator/config

# Installing NVim
echo -e "Configuring nvim..."
cp -r nvim ~/.config/nvim

# Configuring Powerlevel10k and Zsh
echo -e "Configuring zsh..."
cp zsh/p10k.zsh ~/.p10k.zsh
cp zsh/zshrc ~/.zshrc
cp zsh/inputrc ~/.inputrc

echo -e "Configuring git..."
cp git/gitconfig ~/.gitconfig
