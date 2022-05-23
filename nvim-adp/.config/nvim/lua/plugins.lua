local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  -- vim.cmd('packadd packer.nvim')
  -- vim.cmd('PackerSync')
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

return require('packer').startup(function()
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- Check "awesome plugins" on:
    -- https://github.com/rockerBOO/awesome-neovim/blob/main/README.md

    -- general
    use {'inkarkat/vim-ReplaceWithRegister'} -- replace text with the contents of a register
    use {'mbbill/undotree'} -- undotree
    use {'tpope/vim-commentary'} -- smart commenting
    use {'machakann/vim-highlightedyank', requires = {'config.highlightedyank'}} -- highlight yanked section
    use {'APZelos/blamer.nvim', requires = {'config.blamer'}} -- git blame

    -- appearance
    use {'lukas-reineke/indent-blankline.nvim', config = function() require'indent_blankline'.setup {filetype = {'python', 'json', 'bzl'} } end } -- adds indentation guides to all lines
    use {'kyazdani42/nvim-web-devicons', config = function() require'devicons'.setup() end } -- dev icons
    use {'nvim-lualine/lualine.nvim', config = function() require'config.lualine'.setup() end } -- bottom status line
    use {'norcalli/nvim-colorizer.lua', config = function() require'colorizer'.setup() end } -- colorize color hexes
    use {'folke/todo-comments.nvim', config = function() require'todo-comments'.setup() end } -- highlight TODOs in the code
    use {'akinsho/nvim-bufferline.lua', config = function() require'config.bufferline'.setup() end } -- show buffers in tab line
    use {'luukvbaal/stabilize.nvim', config = function() require("stabilize").setup() end } -- stabilize window when opening new ones

    -- colorschemes
    use {'ChristianChiarulli/nvcode-color-schemes.vim'} -- VS Code-like colorscheme
    use {'joshdick/onedark.vim'} -- Atom-like colorscheme
    use {'morhetz/gruvbox'} -- gruuuuuuuuuuuuuuuuvbox colorscheme
    use {'sainnhe/gruvbox-material'} -- gruuuuuuuuuuuuuuuuvbox colorscheme
    use {'arcticicestudio/nord-vim'} -- the one and only

    -- startscreen -alpha-nvim
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.opts)
        end
    }

    -- filetree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require'config.nvimtree'.setup() end
    }

    -- markdown
    use {'davidgranstrom/nvim-markdown-preview'}

    -- git
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-rhubarb'}
    use {'lewis6991/gitsigns.nvim', config = function() require'config.gitsigns'.setup() end }
    use {'rhysd/conflict-marker.vim'}

    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require'config.treesitter'.setup() end }
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'nvim-treesitter/playground'}

    -- null-ls for autoformat
    use {'jose-elias-alvarez/null-ls.nvim', config = function() require'config.null-ls'.setup() end }

    -- lsp
    use {'folke/trouble.nvim', config = function() require'trouble'.setup() end }
    use {'neovim/nvim-lspconfig', config = function() require'config.nvim-lspconfig'.setup() end }
    use {'williamboman/nvim-lsp-installer', config = function() require'config.nvim-lsp'.setup() end }
    use {'ray-x/lsp_signature.nvim', config = function() require'lsp_signature'.setup({hint_enable = false}) end }
    use {'aymericbeaumet/vim-symlink'}
    use {'onsails/lspkind-nvim', config = function() require'lspkind'.init() end }

    -- telescope
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'nvim-telescope/telescope-file-browser.nvim'}
    use {'nvim-telescope/telescope.nvim', config = function() require'config.telescope'.setup() end }

    -- terminal
    use {'voldikss/vim-floaterm', requires = {'config.floaterm'}}

    -- debugging
    use {'szw/vim-maximizer'}
    use {'rcarriga/nvim-dap-ui'}
    use {'mfussenegger/nvim-dap', config = function() require'config.dap'.setup() end }
    use {'nvim-telescope/telescope-dap.nvim'}
    -- use {'Pocco81/DAPInstall.nvim', config = function() require("dap-install").setup() end }

    -- Harpoon for most recent files editing
    use {'ThePrimeagen/harpoon', config = function() require'config.harpoon' end }

    -- bazel
    use {'google/vim-maktaba'}
    use {'bazelbuild/vim-bazel'}
    use {'alexander-born/bazel-vim', config = function() require'config.bazel'.setup() end }

    -- cmp
    use {'hrsh7th/nvim-cmp', config = function() require'config.cmp'.setup() end }
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-vsnip'}
    use {'alexander-born/cmp-bazel'}

    -- snippets
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}

    -- find and replace
    use {'nvim-pack/nvim-spectre', requires = {'nvim-lua/plenary.nvim'}}

    -- Github copilot
    use {'github/copilot.vim'}

    -- miscenallaneous
    use {'airblade/vim-rooter', requires = {'config.rooter'}} -- change vim root folder automatically

end)