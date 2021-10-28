local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd('packadd packer.nvim')
  vim.cmd('PackerSync')
end

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

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

    -- Nvim tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require'config.nvimtree'.setup() end
    }

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

    -- Bazel
    use {'alexander-born/bazel-vim', config = function() require'config.bazel'.setup() end }

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
