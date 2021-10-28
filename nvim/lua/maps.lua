local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

options = { noremap = true }

map('n', '<C-p>', ':NvimTreeToggle<cr>:NvimTreeRefresh<cr>', options)

-- Sensible defaults
-- map('', 'Q', '') -- disable
