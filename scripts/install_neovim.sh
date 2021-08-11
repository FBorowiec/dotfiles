#!/bin/bash

echo -e "Installing neovim..."
cd && git clone https://github.com/neovim/neovim.git && cd neovim && make && sudo make install
