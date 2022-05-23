-- GENERAL ---------------------------------------------------------------------
local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

options = { noremap = true }

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

-- deletes visual selection and pastes without changing default register
map('v', 'p', '"_dP')

-- go to first file on line
map('n', 'gf', '^f/gf')

-- Keeping it centered while iterating through results with n
map('n', 'n', 'nzzzv', options)
map('n', 'N', 'Nzzzv', options)
map('n', 'J', 'mzJ`z', options)

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

-- Make current file executable
map('n', '<leader>x', ':!chmod +x %<cr>', options)

-- PLUGINS ---------------------------------------------------------------------
-- lsp
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', '<leader>r', vim.lsp.buf.references)
map('n', '<leader>q', vim.diagnostic.setqflist)

-- NvimTree -----------------------------------------------
map('n', '<C-p>', ':NvimTreeToggle<cr>:NvimTreeRefresh<cr>', options) -- toggle Nvim Tree
map('n', '<leader>n', require'config.nvimtree'.nvim_tree_find_file)

-- floaterm -----------------------------------------------
vim.g.floaterm_keymap_toggle = "<leader>tt" -- toggle terminal
vim.g.floaterm_keymap_prev   = "<leader>tp" -- next terminal
vim.g.floaterm_keymap_next   = "<leader>tn" -- previous terminal
vim.g.floaterm_keymap_new    = "<leader>tf" -- create new terminal window

-- switch between cpp header and source file
map('n', '<F2>', vim.fn.SwitchSourceHeader)

-- spectre ------------------------------------------------
map('n', '<leader>S', ":lua require('spectre').open()<cr>", options) -- run command :Spectre
map('n', '<leader>sw', ":lua require('spectre').open_visual({select_word=true})<cr>", options) -- search current word
map('v', '<leader>s', ":lua require('spectre').open_visual()<cr>", options) -- search current word

-- search in current file ---------------------------------
map('n', '<leader>sp', ":lua require('spectre').open_file_search()<cr>", options)

-- harpoon ------------------------------------------------
map('n', '<leader>h', ":lua require('harpoon.mark').add_file()<CR>", options)
map('n', '<C-h>', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", options)

-- undotree -----------------------------------------------
map('n', '<leader>u', ':UndotreeToggle<CR>', options)

-- markdown preview ---------------------------------------
map('n', '<leader><space>mp', ':MarkdownPreviewToggle<cr>', options)
map('n', '<leader><space>mi', ':call mkdp#util#install()<cr>', options)

-- maximizer ----------------------------------------------
map('n', '<leader>m', ':MaximizerToggle!<cr>', options)

-- git fugitive -------------------------------------------
map('n', '<leader>gj', ':diffget //3<cr>', options)
map('n', '<leader>gf', ':diffget //2<cr>', options)
map('n', '<leader>gs', ':G<cr>', options) -- gv on a file (inside the status menu) to resolve conflicts
map('n', '<leader>gb', ':Git blame<cr>', options)
map('n', '<leader>gd', ':Gdiff<cr>', options)

-- gitsigns -----------------------------------------------
-- Navigation
map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
-- Actions
map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
map('n', ';s', gs.stage_buffer)
map('n', ';u', gs.undo_stage_hunk)
map('n', ';r', gs.reset_buffer)
map('n', ';p', gs.preview_hunk)
map('n', ';b', function() gs.blame_line{full=true} end)
map('n', ';bt', gs.toggle_current_line_blame)
map('n', ';d', gs.diffthis)
map('n', ';D', function() gs.diffthis('~') end)
map('n', ';t', gs.toggle_deleted)
-- text object
map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

-- debugging

