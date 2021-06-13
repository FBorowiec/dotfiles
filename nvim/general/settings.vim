syntax on
set noerrorbells
set clipboard=unnamed

" relative line numbering
:set relativenumber
:set number
:set number relativenumber

" indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" search
set incsearch
set hlsearch
set smartcase

" mouse
set mouse=a

" misc
set nu
set nowrap
set noswapfile

" More space for messages
set cmdheight=2
set scrolloff=8

" backup
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set colorcolumn=120
highlight Colorcolumn ctermbg=0 guibg=lightgrey
