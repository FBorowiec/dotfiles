local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

options = { noremap = true }

-- Sensible defaults
-- map('', 'Q', '') -- disable

-- Better indenting
map('v', '<', '<gv', options)
map('v', '>', '>gv', options)

-- alias for 'escape' to NORMAL from INSERT
map('i', 'jk', '<Esc>', options)
map('i', 'jj', '<Esc>', options)

-- Move selected line / block of text in visual mode
-- shift + k to move up
map('x', 'K', ':move \'<-2<cr>gv-gv', options)
-- shift + j to move down
map('x', 'J', ':move \'>+1<cr>gv-gv', options)

-- move lines using 'Alt', vscode-like
map('n', '<M-Up>', ':move -2<cr>', options)
map('n', '<M-Down>', ':move +1<cr>', options)

-- Faster writing / quitting
map('n', '<leader>w', ':w<cr>', options)
map('n', '<leader>q', ':q<cr>', options)
map('n', '<leader>Q', ':q!<cr>', options)

-- Nohighlight
map('n', '<leader>nh', ':nohlsearch<cr>', options)

-- Make Y behave like other capital letters (C, D)
map('n', 'Y', 'y$', options)

-- Keeping it centered while iterating through results with n
map('n', 'n', 'nzzzv', options)
map('n', 'N', 'Nzzzv', options)
map('n', 'J', 'mzJ`z', options)

-- Undo break points
map('i', ',', ',<c-g>u', options)
map('i', '.', '.<c-g>u', options)
map('i', '!', '!<c-g>u', options)
map('i', '?', '?<c-g>u', options)

-- Moving text
map('v', 'J', ':m \'>+1<CR>gv=gv', options)
map('v', 'K', ':m \'<-2<CR>gv=gv', options)
map('i', '<C-j>', '<Esc>:m .+1<cr>==', options)
map('i', '<C-k>', '<Esc>:m .-2<cr>==', options)

-- Quickfix and Location list
map('n', '<C-j>', ':cnext<cr>', options)
map('n', '<C-k>', ':cprev<cr>', options)
map('n', '<leader>j', ':lnext<cr>', options)
map('n', '<leader>k', ':lprev<cr>', options)

-- Close all splits and go to last window
map('n', ';q', '<C-w><C-O>', options)

-- Quick window resize
map('n', '<leader>+', ':exe "resize " . (winheight(0) * 3/2)<cr>', options)
map('n', '<leader>-', ':exe "resize " . (winheight(0) * 2/3)<cr>', options)

-- DebugThisTest for cpp files
map('n', '<leader>bdt', ':lua require\'bazel\'.DebugThisTest()<cr>', options)

-- Make current file executable
map('n', '<leader>x', ':!chmod +x %<cr>', options)

-- Plugins
map('n', '<C-p>', ':NvimTreeToggle<cr>:NvimTreeRefresh<cr>', options)
