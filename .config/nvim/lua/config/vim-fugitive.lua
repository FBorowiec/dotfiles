local map = vim.api.nvim_set_keymap

options = { noremap = true }

map('n', '<leader>gj', ':diffget //3<cr>', options)
map('n', '<leader>gf', ':diffget //2<cr>', options)
map('n', '<leader>gs', ':G<cr>', options) -- gv on a file (inside the status menu) to resolve conflicts
map('n', '<leader>gb', ':Git blame<cr>', options)
map('n', '<leader>gd', ':Gdiff<cr>', options)
