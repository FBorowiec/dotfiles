#!/bin/bash

fdfind --type f | fzf-tmux --border --margin=0,1 --preview "bat -f -P --plain {1}" | xargs -r nvim
