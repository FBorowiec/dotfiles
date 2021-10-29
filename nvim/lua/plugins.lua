local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd('packadd packer.nvim')
  vim.cmd('PackerSync')
end

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerSync]])
-- vim.cmd[[
--   augroup Packer_aug
--   autocmd!
--   autocmd BufWritePost plugins.lua PackerCompile
--   autocmd BufWritePost plugins.lua PackerClean
--   autocmd BufWritePost plugins.lua PackerInstall
--   augroup END
-- ]]


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

    -- Debugging
    -- use {
    --     'mfussenegger/nvim-dap',
    --     opt = true,
    --     ft = {'python'},
    --     requires = {
    --         {'mfussenegger/nvim-dap-python', opt = true},
    --         {
    --             'theHamsta/nvim-dap-virtual-text',
    --             opt = true,
    --             after = 'nvim-treesitter'
    --         }
    --     },
    --     setup = require('config/nvim-dap').setup,
    --     config = require('config/nvim-dap').config
    -- }
end)
