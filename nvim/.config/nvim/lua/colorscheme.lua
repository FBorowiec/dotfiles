vim.cmd([[
    syntax enable
    if has('termguicolors')
        set termguicolors
        hi LineNr ctermbg=NONE guibg=NONE
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set background=dark
    colorscheme nordic
    set guifont=DroidSansMono\ Nerd\ Font\ 11
    highlight Normal ctermbg=none guibg=none
    highlight NonText ctermbg=none guibg=none
]])
