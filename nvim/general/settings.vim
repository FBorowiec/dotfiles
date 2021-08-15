syntax on
set noerrorbells  " Disable error bells
set clipboard=unnamed,unnamedplus  " Use + registers for clipboard
set cursorline  " Highlight current line
set encoding=utf-8  " Use UTF-8 encoding

" relative line numbering
set relativenumber
set number

" indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab  " Tabs are spaces
set smartindent

" search
set incsearch
set hlsearch
set smartcase

" mouse in all modes
" set mouse=a

" misc
set nu
set nowrap
set noswapfile

" More space for messages
set cmdheight=2
set scrolloff=8

" Backup
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set colorcolumn=120
highlight Colorcolumn ctermbg=0 guibg=lightgrey

" Focus on new splits
set splitbelow
set splitright

" Timeout length
set timeoutlen=400

" Refresh buffers automatically
set autoread
