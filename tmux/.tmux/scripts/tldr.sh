#!/usr/bin/env bash

tmux neww bash -c 'tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr & while [ : ]; do sleep 1; done'
