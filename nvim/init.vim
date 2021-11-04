" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lua plugins and settings
lua require('plugins')
lua require('mappings')

" Nvim settings
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim

" Mappings and functions
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim

" Themes
source $HOME/.config/nvim/plug-config/colorscheme.vim
source $HOME/.config/nvim/plug-config/vim-airline.vim
source $HOME/.config/nvim/plug-config/vim-highlightedyank.vim

" Plugin Configuration
source $HOME/.config/nvim/plug-config/blamer.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/maximizer.vim
source $HOME/.config/nvim/plug-config/nvim-lsp.vim
source $HOME/.config/nvim/plug-config/nvim-lspconfig.vim
source $HOME/.config/nvim/plug-config/rooter.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/textmagic.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/vim-codefmt.vim
source $HOME/.config/nvim/plug-config/vim-fugitive.vim
source $HOME/.config/nvim/plug-config/vim-devicons.vim

" Use local vimrc if available {
if filereadable(expand("~/.vimrc.local"))
    source $HOME/.vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
