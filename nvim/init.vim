set exrc
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=100
set signcolumn=yes

" More space for messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms) leads to noticeable delays and
" poor user experience
set updatetime=50

" Don't pass message to |ins-completion-menu|.
set shortmess+=c

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
" Plug 'git@github.com:ycm-core/YouCompleteMe.git'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" if (has('nvim'))
"     let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
" endif

colorscheme nord
highlight Normal guibg=none

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})

