" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Text Navigation
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'

" theme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'

" Floating terminal
Plug 'voldikss/vim-floaterm'

" Zen mode
Plug 'junegunn/goyo.vim'

" Bazel build tools
" Add maktaba and bazel to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" Auto pairs and settings for parenthesis
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" File navigation and fuzzy finder
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'tpope/vim-eunuch'
Plug 'bronson/vim-visual-star-search'
Plug 'kopischke/vim-fetch'

" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'

" Snippets
Plug 'sirver/ultisnips'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'
Plug 'junegunn/gv.vim'
" Plug 'tpope/vim-rhubarb'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'grailbio/bazel-compilation-database'

" Whichkey
Plug 'liuchengxu/vim-which-key'

" Devicons
Plug 'ryanoasis/vim-devicons'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
