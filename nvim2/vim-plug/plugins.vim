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

" floating terminal
Plug 'voldikss/vim-floaterm'

" zen mode
Plug 'junegunn/goyo.vim'

" bazel build tools
" Add maktaba and bazel to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" Auto pairs and settings for parenthesis
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" File navigation and fuzzy finder
Plug 'scrooloose/nerdtree'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'tpope/vim-eunuch'

" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'

" git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" " whichkey
" Plug 'liuchengxu/vim-which-key'
"
" " fzf
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
" Plug 'junegunn/fzf.vim'
" Plug 'airblade/vim-rooter'
"
" " git
" Plug 'tpope/vim-rhubarb'
" Plug 'junegunn/gv.vim'
"
" " coc-lsp
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" " cxx-highlight
" Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'vim-syntastic/syntastic'
"
" "cpp-format
" Plug 'rhysd/vim-clang-format'
"
" " snippets
" Plug 'honza/vim-snippets'
" Plug 'mattn/emmet-vim'
"
" " cmake-build
" Plug 'cdelledonne/vim-cmake'
"
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
