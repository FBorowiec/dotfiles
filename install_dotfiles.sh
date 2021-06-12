#!/bin/bash

# Installing terminator config
echo "Installing Terminator config file.."
mkdir -p ~/.config/terminator/
cp terminator/config ~/.config/terminator/config

# Installing NVim
echo -e "Configuring nvim..."
cp -r nvim2 ~/.config/nvim

# Configuring Powerlevel10k and Zsh
echo -e "Configuring zsh..."
cp zsh/p10k.zsh ~/.p10k.zsh
cp zsh/zshrc ~/.zshrc

echo -e "Configuring git..."
cp git/gitconfig ~/.gitconfig
