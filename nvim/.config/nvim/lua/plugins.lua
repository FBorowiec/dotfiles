local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd('packadd packer.nvim')
  vim.cmd('PackerSync')
end

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerSync]])

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- completion
    use {'onsails/lspkind-nvim', config = function() require'lspkind'.init() end }

    -- cmp
    use {'hrsh7th/nvim-cmp', config = function() require'config.cmp'.setup() end }
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-vsnip'}
    use {'alexander-born/cmp-bazel'}

    -- Nvim tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require'config.nvimtree'.setup() end
    }

    -- Telescope
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope-fzy-native.nvim'}
    use {'nvim-telescope/telescope.nvim', config = function() require'config.telescope'.setup() end }

    -- Navigating buffers
    use {
        'romgrk/barbar.nvim',
        event = { 'VimEnter' },
        setup = require('config.barbar').setup,
        config = require('config.barbar').config,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- Alpha-nvim
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.opts)
        end
    }

    -- Themes
    use {'joshdick/onedark.vim'}
    use {'christianchiarulli/nvcode-color-schemes.vim'}
    use {'morhetz/gruvbox'}
    use {'sainnhe/gruvbox-material'}
    use {'arcticicestudio/nord-vim'}

    -- Bazel
    use {'alexander-born/bazel-vim', config = function() require'config.bazel'.setup() end }

    -- undotree
    use {'mbbill/undotree', config = function() require'config.undotree' end }

    -- markdown
    use {
        'iamcco/markdown-preview.nvim',
        ft = {'markdown'},
        run = 'vim.cmd("mkdp#util#install()")',
        config = function() require'config.markdown-preview' end
    }

    -- snippets
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}

    -- Harpoon for most recent files editing
    use {'ThePrimeagen/harpoon', config = function() require'config.harpoon' end }

    -- Find and replace
    use {'brooth/far.vim'}
    -- Go to file with: vim path/to/file.ext:12:3 in shell or :e path/to/file.ext:12:3
    use {'wsdjeg/vim-fetch'}

    -- Editing
    use {'tpope/vim-commentary'}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require'config.treesitter'.setup() end }
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'nvim-treesitter/playground'}

    -- Debugging
    use {'rcarriga/nvim-dap-ui'}
    use {'mfussenegger/nvim-dap', config = function() require'config.dap'.setup() end }
    use {'nvim-telescope/telescope-dap.nvim'}
    use {'Pocco81/DAPInstall.nvim', config = function() require("dap-install").setup() end }

    -- Easy maximization with <leader>m
    use {'szw/vim-maximizer', config = function() require'config.maximizer' end }

    -- Which key
    use {'folke/which-key.nvim', config = function() require'config.which-key' end }

    -- Github copilot
    use {'github/copilot.vim'}

    -- Quick switching to desired tab with <leader><TAB>
    use {'https://gitlab.com/yorickpeterse/nvim-window.git', config = function() require'config.nvim-window' end }

    -- Lua development
    use {'tjdevries/nlua.nvim'}
    use {'nvim-lua/completion-nvim'}
    use {'euclidianAce/BetterLua.vim'}
    use {'tjdevries/manillua.nvim'}

    -- Vim commands inside of vim
    use {'tpope/vim-fugitive', config = function() require'config.vim-fugitive' end }
end)
