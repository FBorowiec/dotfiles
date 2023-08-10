-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local options = { noremap = true }

-- Alias for 'escape' to NORMAL from INSERT
map("i", "jk", "<Esc>", options)
map("i", "jj", "<Esc>", options)

-- Keeping it centered while iterating through results with n
map("n", "n", "nzzzv", options)
map("n", "N", "Nzzzv", options)
map("n", "J", "mzJ`z", options)

-- Keeping it centered while moving halp page up/down
map("n", "<C-u>", "<C-u>zz", options)
map("n", "<C-d>", "<C-d>zz", options)

-- Moving text
map("v", "J", ":m '>+1<CR>gv=gv", options)
map("v", "K", ":m '<-2<CR>gv=gv", options)

-- Quickfix and Location list
map("n", "<C-j>", ":cnext<cr>zz", options)
map("n", "<C-k>", ":cprev<cr>zz", options)

-- Switch between cpp header and source file
map("n", "<F2>", vim.fn.SwitchSourceHeader, options)

-- Toggle transparency
map("n", "<F1>", ":TransparentToggle<cr>", options)

-- Harpoon
map("n", "<A-h>", ":lua require('harpoon.mark').add_file()<cr>", options)
map("n", "<C-h>", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", options)
map("n", "<leader>j", ":lua require('harpoon.ui').nav_next()<cr>", options) -- navigates to next mark
map("n", "<leader>k", ":lua require('harpoon.ui').nav_prev()<cr>", options) -- navigates to previous mark

-- Close all splits and go to last window
map("n", "<leader>;q", "<C-w><C-O>", options)

-- Maximizer
map("n", "<leader>m", ":MaximizerToggle!<cr>", options)

-- Git fugitive
map("n", "<leader>gj", ":diffget //3<cr>", options)
map("n", "<leader>gf", ":diffget //2<cr>", options)

-- Focus
map("n", "<c-l>", ":FocusToggle<CR>", { silent = true })
