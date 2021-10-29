vim.api.nvim_set_keymap('n', '<leader><space>mp', ':MarkdownPreviewToggle<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><space>mi', ':call mkdp#util#install()<cr>', { noremap = true })
