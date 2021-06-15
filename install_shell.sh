#!/bin/bash

# Beautify logs
CHECK_MARK="\033[0;32m\u2713"

echo -e "Updating zshell..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && exit

# Installing powerlevel10k
echo -e "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k/powerlevel10k"/' ${HOME}/.zshrc
sed -i 's/plugins=(.*)/plugins=(bazel docker docker-compose docker-machine git zsh-autosuggestions zsh-navigation-tools)/' ${HOME}/.zshrc
