" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TEXT NAVIGATION ----------------------------------------------
" <leader>s for quick searching a char
Plug 'easymotion/vim-easymotion'
" Highlight unique words to help using f, F, t and T
Plug 'unblevable/quick-scope'

" THEMES -------------------------------------------------------
" Theme for Nvim - Onedark theme
Plug 'joshdick/onedark.vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'
" Status tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Nvim startuppage
Plug 'mhinz/vim-startify'

" FLOATING TERMINAL --------------------------------------------
Plug 'voldikss/vim-floaterm'

" AUTO PAIRS AND SETTINGS FOR PARENTHESIS ----------------------
" cs"' to change surrounding "" to ''
Plug 'tpope/vim-surround'
" Plug 'jiangmiao/auto-pairs'

" FUZZY FINDER - TELESCOPE -------------------------------------
" required by telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Native fzy support for Telescope
Plug 'nvim-telescope/telescope-fzy-native.nvim', {'do': 'make' }
" Find and replace
Plug 'brooth/far.vim'
" Go to file with: vim path/to/file.ext:12:3 in shell or :e path/to/file.ext:12:3
Plug 'wsdjeg/vim-fetch'

" EDITING / FORMATTING -----------------------------------------
" VS-Code <C-d> like multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Highlight yanked selection
Plug 'machakann/vim-highlightedyank'
" Quick commenting for any type of file
Plug 'tpope/vim-commentary'
" Code formatters
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'

" GIT / UNDOTREE -----------------------------------------------
" Undotree
Plug 'mbbill/undotree'
" See current changes in the line number column
Plug 'mhinz/vim-signify'
" Vim commands inside of vim
Plug 'tpope/vim-fugitive'
" Git lens
Plug 'APZelos/blamer.nvim'

" TREESITTER ---------------------------------------------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'

" NATIVE LSP ---------------------------------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'aymericbeaumet/vim-symlink'

" BAZEL BUILD TOOLS --------------------------------------------
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'grailbio/bazel-compilation-database'

" MISCELLANEOUS ------------------------------------------------
" Measuring Nvim startup time
Plug 'tweekmonster/startuptime.vim'
" Preview for Markdown files
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Easy maximization with <leader>m
Plug 'szw/vim-maximizer'
" Unix shell commands :Chmod ...
Plug 'tpope/vim-eunuch'
" Change vim root folder automatically
Plug 'airblade/vim-rooter'
" Vim persistence
Plug 'tpope/vim-obsession'

" DEBUGGING ----------------------------------------------------
Plug 'puremourning/vimspector'
" Plug 'mfussenegger/nvim-dap'

" WHICHKEY -----------------------------------------------------
Plug 'folke/which-key.nvim'

" DEVICONS -----------------------------------------------------
Plug 'ryanoasis/vim-devicons'
Plug 'her/synicons.vim'
Plug 'kyazdani42/nvim-web-devicons'

" BUFFERS AND TREE NAVIGATION ----------------------------------
" Nvim Tree
Plug 'kyazdani42/nvim-tree.lua'
" Navigating buffer with <A-...> keys
Plug 'romgrk/barbar.nvim'
" Quick switching to desired tab with <leader><TAB>
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
" Ranger for file navigation
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
