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

" THEMES -------------------------------------------------------
" Status tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" FLOATING TERMINAL --------------------------------------------
Plug 'voldikss/vim-floaterm'

" EDITING / FORMATTING -----------------------------------------
" Highlight yanked selection
Plug 'machakann/vim-highlightedyank'
" Code formatters
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'

" GIT / UNDOTREE -----------------------------------------------
" See current changes in the line number column
Plug 'mhinz/vim-signify'
" Vim commands inside of vim
Plug 'tpope/vim-fugitive'
" Git lens
Plug 'APZelos/blamer.nvim'

" NATIVE LSP ---------------------------------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'aymericbeaumet/vim-symlink'

" BAZEL BUILD TOOLS --------------------------------------------
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'alexander-born/bazel-vim'
Plug 'grailbio/bazel-compilation-database'

" MISCELLANEOUS ------------------------------------------------
" Measuring Nvim startup time
Plug 'tweekmonster/startuptime.vim'
" Preview for Markdown files
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Tex
Plug 'jakewvincent/texmagic.nvim'

" Unix shell commands :Chmod ...
Plug 'tpope/vim-eunuch'
" Change vim root folder automatically
Plug 'airblade/vim-rooter'
" Vim persistence
Plug 'tpope/vim-obsession'
" Visualize hex colors
Plug 'gko/vim-coloresque'

" DEBUGGING ----------------------------------------------------
Plug 'puremourning/vimspector'
" Plug 'mfussenegger/nvim-dap'

" DEVICONS -----------------------------------------------------
Plug 'ryanoasis/vim-devicons'
Plug 'her/synicons.vim'
Plug 'kyazdani42/nvim-web-devicons'

" BUFFERS AND TREE NAVIGATION ----------------------------------
" Ranger for file navigation
Plug 'rbgrouleff/bclose.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
