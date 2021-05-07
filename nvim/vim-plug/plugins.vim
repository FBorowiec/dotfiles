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
" plugins for both the cases
" ---

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('g:vscode')
    Plug 'ChristianChiarulli/vscode-easymotion'
    Plug 'machakann/vim-highlightedyank'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

else
    " Easymotion
    Plug 'easymotion/vim-easymotion'

    " theme
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'machakann/vim-highlightedyank'

    " whichkey
    Plug 'liuchengxu/vim-which-key'

    " floating terminal
    Plug 'voldikss/vim-floaterm'

    " ranger
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'

    " zen mode
    Plug 'junegunn/goyo.vim'

    " commenting files
    Plug 'tpope/vim-commentary'

    " Text Navigation
    Plug 'unblevable/quick-scope'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Closetags
    Plug 'alvan/vim-closetag'

    " fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    " git
    Plug 'airblade/vim-gitgutter'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    " coc-lsp
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " cxx-highlight
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'vim-syntastic/syntastic'

    "cpp-format
    Plug 'rhysd/vim-clang-format'

    " snippets
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'

    " undo time travel
    Plug 'mbbill/undotree'

    " Interactive code
    Plug 'metakirby5/codi.vim'

    " cmake-build
    Plug 'cdelledonne/vim-cmake'

    " bazel build tools
    " Add maktaba and bazel to the runtimepath.
    " (The latter must be installed before it can be used.)
    Plug 'google/vim-maktaba'
    Plug 'bazelbuild/vim-bazel'

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
