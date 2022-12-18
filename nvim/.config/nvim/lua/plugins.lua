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

    -- core
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }

    -- LSP and AST
    -- lsp configuration and plugins
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',
        },
    }
    use { 'jose-elias-alvarez/null-ls.nvim' }
    use { 'ray-x/lsp_signature.nvim', config = function() require 'lsp_signature'.setup({ hint_enable = false }) end }
    use { 'aymericbeaumet/vim-symlink' }
    use { 'onsails/lspkind-nvim', config = function() require 'lspkind'.init() end }
    use { 'folke/trouble.nvim', config = function() require 'trouble'.setup() end }

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'nvim-treesitter/nvim-treesitter-context' }
    use { 'nvim-treesitter/playground' }

    -- FUZZY FINDERS AND FILE NAVIGATION
    -- telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'nvim-telescope/telescope-live-grep-args.nvim' }
    use { 'nvim-telescope/telescope-media-files.nvim' }
    use { 'debugloop/telescope-undo.nvim', requires = { 'mbbill/undotree' } }
    use { 'nvim-telescope/telescope.nvim' }

    -- filetree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- harpoon for most recent files editing
    use { 'ThePrimeagen/harpoon' }

    -- general
    use { 'inkarkat/vim-ReplaceWithRegister' } -- replace text with the contents of a register
    use { 'tpope/vim-commentary' } -- smart commenting with 'gcc'
    -- use { 'numToStr/Comment.nvim' }

    -- AUTOCOMPLETION AND SNIPPETS
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            -- autocompletion
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'alexander-born/cmp-bazel' },

            -- snippets
            { 'saadparwaiz1/cmp_luasnip' },
            { 'L3MON4D3/LuaSnip' },
        },
    }

    -- GIT
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-rhubarb' }
    use { 'tpope/vim-sleuth' } -- detect tabstop and shiftwidth automatically
    use { 'lewis6991/gitsigns.nvim' }
    use { 'rhysd/conflict-marker.vim' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'APZelos/blamer.nvim' } -- git blame
    use { 'airblade/vim-rooter' } -- change vim root folder automatically


    -- TERMINAL
    use { 'voldikss/vim-floaterm' }

    -- DEBUGGING
    use { 'szw/vim-maximizer' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'mfussenegger/nvim-dap' }
    use { 'mfussenegger/nvim-dap-python', config = function() require 'dap-python'.setup() end }
    use { 'nvim-telescope/telescope-dap.nvim' }
    use { 'theHamsta/nvim-dap-virtual-text', config = function() require 'nvim-dap-virtual-text'.setup() end }
    -- use {'Pocco81/DAPInstall.nvim', config = function() require("dap-install").setup() end }

    -- APPEARANCE
    -- colorschemes: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
    use { 'EdenEast/nightfox.nvim' }
    use { 'shaunsingh/nord.nvim' }

    -- adds indentation guides to all lines
    use { 'lukas-reineke/indent-blankline.nvim', config = function() require 'indent_blankline'.setup {
            filetype = { 'cpp', 'python', 'json', 'bzl' }
        }
    end
    }
    use { 'nvim-lualine/lualine.nvim' } -- bottom status line
    use { 'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end } -- colorize color hexes
    use {
        'romgrk/barbar.nvim', -- show buffers in tab line
        event = { 'VimEnter' },
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
    use {
        'petertriho/nvim-scrollbar',
        requires = { 'lewis6991/gitsigns.nvim', opt = true }
    }
    -- alternative to nvim-scrollbar
    -- use {
    --     'lewis6991/satellite.nvim',
    --     config = function()
    --         require('satellite').setup()
    --     end
    -- }

    -- AI
    -- copilot
    -- use { 'github/copilot.vim' }
    use {
        'zbirenbaum/copilot.lua',
        event = 'VimEnter',
        config = function()
            vim.defer_fn(function()
                require('copilot').setup()
            end, 100)
        end,
    }
    use {
        'zbirenbaum/copilot-cmp',
        after = { 'copilot.lua' },
        config = function()
            require('copilot_cmp').setup()
        end
    }
    -- openai
    use {
        'jackMort/ChatGPT.nvim',
        requires = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        }
    }

    -- MISCENALLANEOUS
    -- markdown
    use { 'davidgranstrom/nvim-markdown-preview' }
    use { 'mzlogin/vim-markdown-toc' }

    -- bazel
    use { 'google/vim-maktaba' }
    use { 'bazelbuild/vim-bazel' }
    use { 'alexander-born/bazel-vim' }

    -- which key
    use { 'folke/which-key.nvim' }

    use { 'sudormrfbin/cheatsheet.nvim' }
    use { 'chrisbra/csv.vim' }
    use {
        'lewis6991/spellsitter.nvim',
        config = function()
            require('spellsitter').setup()
        end
    }
    -- easier match finding
    use { 'kevinhwang91/nvim-hlslens' }

    -- appearance - devicons - needs to be last
    use { 'kyazdani42/nvim-web-devicons' } -- dev icons
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
