#!/bin/bash

# Installing terminator config
echo "Installing Terminator config file.."
mkdir -p ~/.config/terminator/
cp terminator/config ~/.config/terminator/config

# Installing NVim
cp -r nvim ~/config/nvim
