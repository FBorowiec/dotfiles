lua << EOF
require'nvim-web-devicons'.get_icons()
EOF

if empty(glob("~/.local/share/fonts/ubuntu-mono-powerline-ttf"))
    echo "Installing powerline fonts..\n"
    silent !mkdir -p ~/.fonts/ubuntu-mono-powerline-ttf
    execute 'silent !wget -q -P ~/.local/share/fonts/ubuntu-mono-powerline-ttf/ "https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu Mono derivative Powerline Bold Italic.ttf"'
    execute 'silent !wget -q -P ~/.local/share/fonts/ubuntu-mono-powerline-ttf/ "https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu Mono derivative Powerline Bold.ttf"'
    execute 'silent !wget -q -P ~/.local/share/fonts/ubuntu-mono-powerline-ttf/ "https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu Mono derivative Powerline Italic.ttf"'
    execute 'silent !wget -q -P ~/.local/share/fonts/ubuntu-mono-powerline-ttf/ "https://raw.githubusercontent.com/powerline/fonts/master/UbuntuMono/Ubuntu Mono derivative Powerline.ttf"'
    execute 'silent !fc-cache -vf'
endif
