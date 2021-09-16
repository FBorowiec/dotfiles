" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nvim settings
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim

" Mappings and functions
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim

" Themes
source $HOME/.config/nvim/plug-config/colorscheme.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/vim-airline.vim
source $HOME/.config/nvim/plug-config/vim-highlightedyank.vim

" Plugin Configuration
source $HOME/.config/nvim/plug-config/barbar.vim
source $HOME/.config/nvim/plug-config/blamer.vim
source $HOME/.config/nvim/plug-config/easymotion.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/harpoon.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
source $HOME/.config/nvim/plug-config/markdown-preview.vim
source $HOME/.config/nvim/plug-config/maximizer.vim
source $HOME/.config/nvim/plug-config/nvim-tree.vim
source $HOME/.config/nvim/plug-config/nvim-lsp.vim
source $HOME/.config/nvim/plug-config/nvim-window.vim
source $HOME/.config/nvim/plug-config/ranger.vim
source $HOME/.config/nvim/plug-config/rooter.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/textmagic.vim
source $HOME/.config/nvim/plug-config/treesitter.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/vim-codefmt.vim
source $HOME/.config/nvim/plug-config/vim-fugitive.vim
source $HOME/.config/nvim/plug-config/vim-devicons.vim
source $HOME/.config/nvim/plug-config/which-key.vim

" Use local vimrc if available {
if filereadable(expand("~/.vimrc.local"))
    source $HOME/.vimrc.local
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
