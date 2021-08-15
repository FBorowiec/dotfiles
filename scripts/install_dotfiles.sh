#!/bin/bash

# Installing terminator config
ln -s ~/.config/terminator/config terminator/config

# Installing NVim
ln -s ~/.config/nvim nvim

# Configuring Powerlevel10k and Zsh
ln -s ~/.p10k.zsh zsh/p10k.zsh
ln -s ~/.zshrc zsh/zshrc
ln -s ~/.inputrc zsh/inputrc

# git config
ln -s ~/.gitconfig git/gitconfig
ln -s ~/.config/gitignore git/gitignore

# Tmux config
ln -s ~/.tmux.conf tmux/tmux.conf
