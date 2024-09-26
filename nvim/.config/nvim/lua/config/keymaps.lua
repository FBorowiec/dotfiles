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

-- Harpoon
map("n", "<leader>j", ":lua require('harpoon.ui').nav_next()<cr>", options) -- navigates to next mark
map("n", "<leader>k", ":lua require('harpoon.ui').nav_prev()<cr>", options) -- navigates to previous mark

-- Toggle previous & next buffers stored within Harpoon list
local harpoon = require("harpoon")
map("n", "<leader>j", function()
  harpoon:list():prev()
end)
map("n", "<leader>k", function()
  harpoon:list():next()
end)

-- Maximizer
map("n", "<leader>m", ":MaximizerToggle!<cr>", options)
