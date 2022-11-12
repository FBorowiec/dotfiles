-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- general
    use { 'inkarkat/vim-ReplaceWithRegister' } -- replace text with the contents of a register
    use { 'mbbill/undotree' } -- undotree
    -- use { 'numToStr/Comment.nvim' }
    use { 'tpope/vim-commentary' } -- smart commenting with 'gcc'
    use { 'APZelos/blamer.nvim', config = function() require 'config.blamer'.setup() end } -- git blame
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }

    -- cmp
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/nvim-cmp', config = function() require 'config.cmp'.setup() end }
    use { 'alexander-born/cmp-bazel' }

    -- telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'nvim-telescope/telescope-live-grep-args.nvim' }
    use { 'nvim-telescope/telescope-media-files.nvim' }
    use { 'nvim-telescope/telescope.nvim', config = function() require 'config.telescope'.setup() end }

    -- Harpoon for most recent files editing
    use { 'ThePrimeagen/harpoon', config = function() require 'config.harpoon'.setup() end }

    -- colorschemes: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
    use { 'EdenEast/nightfox.nvim' }
    use { 'shaunsingh/nord.nvim', config = function() require 'config.nord'.setup() end }

    -- appearance
    -- adds indentation guides to all lines
    use { 'lukas-reineke/indent-blankline.nvim', config = function() require 'indent_blankline'.setup {
            filetype = { 'cpp', 'python', 'json', 'bzl' }
        }
    end
    }
    use { 'nvim-lualine/lualine.nvim', config = function() require 'config.lualine'.setup() end } -- bottom status line
    use { 'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end } -- colorize color hexes
    use {
        'romgrk/barbar.nvim', -- show buffers in tab line
        event = { 'VimEnter' },
        setup = require('config.barbar').setup,
        config = require('config.barbar').config,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    use { 'beauwilliams/focus.nvim', config = function() require('focus').setup() end }

    -- startscreen alpha-nvim
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.opts)
        end
    }

    -- markdown
    use { 'davidgranstrom/nvim-markdown-preview' }

    -- git
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-rhubarb' }
    use { 'lewis6991/gitsigns.nvim', config = function() require 'config.gitsigns'.setup() end }
    use { 'rhysd/conflict-marker.vim', config = function() require 'config.conflict-marker'.setup() end }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- lsp
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim', config = function() require 'config.mason-lspconfig'.setup() end }
    use { 'neovim/nvim-lspconfig', config = function() require 'config.nvim-lspconfig'.setup() end }
    use { 'jose-elias-alvarez/null-ls.nvim', config = function() require 'config.null-ls'.setup() end }
    use { 'ray-x/lsp_signature.nvim', config = function() require 'lsp_signature'.setup({ hint_enable = false }) end }
    use { 'aymericbeaumet/vim-symlink' }
    use { 'onsails/lspkind-nvim', config = function() require 'lspkind'.init() end }
    use { 'folke/trouble.nvim', config = function() require 'trouble'.setup() end }

    -- terminal
    use { 'voldikss/vim-floaterm', config = function() require 'config.floaterm'.setup() end }

    -- debugging
    use { 'szw/vim-maximizer' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'mfussenegger/nvim-dap', config = function() require 'config.dap'.setup() end }
    use { 'nvim-telescope/telescope-dap.nvim' }
    use { 'theHamsta/nvim-dap-virtual-text', config = function() require 'nvim-dap-virtual-text'.setup() end }
    -- use {'Pocco81/DAPInstall.nvim', config = function() require("dap-install").setup() end }

    -- bazel
    use { 'google/vim-maktaba' }
    use { 'bazelbuild/vim-bazel' }
    use { 'alexander-born/bazel-vim', config = function() require 'config.bazel'.setup() end }

    -- find and replace
    use {
        'nvim-pack/nvim-spectre', config = function() require 'config.spectre'.setup() end,
        requires = { 'nvim-lua/plenary.nvim', opt = true }
    }

    -- which key
    use { 'folke/which-key.nvim', config = function() require 'config.which-key' end }

    -- miscenallaneous
    -- change vim root folder automatically
    use { 'airblade/vim-rooter', config = function() require 'config.rooter'.setup() end }
    -- stabilize window when opening new ones
    use { 'luukvbaal/stabilize.nvim', config = function() require 'stabilize'.setup() end }
    use { 'sudormrfbin/cheatsheet.nvim' }
    use { 'chrisbra/csv.vim' }
    use { 'mzlogin/vim-markdown-toc' }
    use {
        'petertriho/nvim-scrollbar',
        config = function() require 'scrollbar'.setup() end,
        requires = { 'lewis6991/gitsigns.nvim', opt = true }
    }
    -- alternative to nvim-scrollbar
    -- use {
    --     'lewis6991/satellite.nvim',
    --     config = function()
    --         require('satellite').setup()
    --     end
    -- }
    use {
        'lewis6991/spellsitter.nvim',
        config = function()
            require('spellsitter').setup()
        end
    }
    -- easier match finding
    use { 'kevinhwang91/nvim-hlslens', config = function() require 'config.scrollbar'.setup() end }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require 'config.treesitter'.setup() end
    }
    -- use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    -- use { 'nvim-treesitter/nvim-treesitter-context' }
    -- use { 'nvim-treesitter/playground' }


    -- copilot
    use { 'github/copilot.vim' }

    -- appearance - devicons - needs to be last
    use { 'kyazdani42/nvim-web-devicons', config = function() require 'config.devicons'.setup() end } -- dev icons

    -- filetree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require 'config.nvim-tree'.setup() end
    }

    if is_bootstrap then
        require('packer').sync()
    end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '================================='
    print '   Plugins are being installed   '
    print '   Wait until Packer completes,  '
    print '      then restart nvim          '
    print '================================='
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})
