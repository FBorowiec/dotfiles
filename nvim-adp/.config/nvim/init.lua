-- General config
local fn = vim.fn
if not packer_plugins then
  vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  vim.opt.termguicolors = true
end

require('settings')
require('plugins')
require('colorscheme')
require('functions')
require('mappings')
