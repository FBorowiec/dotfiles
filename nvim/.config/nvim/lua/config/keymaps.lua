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

-- Quickfix list navigation
map("n", "<C-j>", ":cnext<cr>zz", options)
map("n", "<C-k>", ":cprev<cr>zz", options)

-- Fast copy path
map(
  "n",
  "<leader>yy",
  ":let @+ = expand('%:p')<CR>",
  { noremap = true, silent = true, desc = "Copy current file path" }
)

-- Harpoon
local harpoon = require("harpoon")
map("n", "<leader>j", function()
  harpoon:list():next()
end, { desc = "󱡀 Harpoon to next file", noremap = true })
map("n", "<leader>k", function()
  harpoon:list():prev()
end, { desc = "󱡀 Harpoon to previous file", noremap = true })

-- Telescope
-- consistent keybinding (same for ranger and custom shell fdfind command)
map(
  "n",
  "<leader>F",
  "<cmd>lua require('telescope.builtin').find_files({ previewer = false })<CR>",
  { noremap = true, silent = true }
)

-- Functions
map("n", "<f2>", SwitchBetweenHeaderSource, { desc = " Switch between header/source", noremap = true })
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "neoterm" then
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "gb",
        ":lua OpenFileWithLineAndColumnInTerm()<CR>",
        { desc = " Go to Bazel target", noremap = true, silent = true }
      )
    end
  end,
})
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "neoterm" then
      vim.api.nvim_buf_set_keymap(
        0,
        "n",
        "gf",
        ":lua OpenFileWithLineAndColumnInTerm()<CR>",
        { desc = " Go to file", noremap = true, silent = true }
      )
    end
  end,
})
