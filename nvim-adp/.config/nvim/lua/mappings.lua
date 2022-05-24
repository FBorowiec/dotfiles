-- GENERAL ---------------------------------------------------------------------
local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables

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
map('v', 'p', '"_dP', options)

-- go to first file on line
map('n', 'gf', '^f/gf', options)

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
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, options)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, options)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, options)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, options)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, options)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, options)

-- NvimTree -----------------------------------------------
map('n', '<C-p>', ':NvimTreeToggle<cr>:NvimTreeRefresh<cr>', options) -- toggle Nvim Tree
vim.keymap.set('n', '<leader>n', require 'config.nvimtree'.nvim_tree_find_file, options)

-- floaterm -----------------------------------------------
vim.g.floaterm_keymap_toggle = "<leader>tt" -- toggle terminal
vim.g.floaterm_keymap_prev   = "<leader>tp" -- next terminal
vim.g.floaterm_keymap_next   = "<leader>tn" -- previous terminal
vim.g.floaterm_keymap_new    = "<leader>tf" -- create new terminal window

-- switch between cpp header and source file
vim.keymap.set('n', '<F2>', vim.fn.SwitchSourceHeader, options)

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
-- -- Navigation
-- map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
-- map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
-- -- Actions
-- map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', options)
-- map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', options)
-- map('n', ';s', gs.stage_buffer)
-- map('n', ';u', gs.undo_stage_hunk)
-- map('n', ';r', gs.reset_buffer)
-- map('n', ';p', gs.preview_hunk)
-- map('n', ';b', function() gs.blame_line { full = true } end)
-- map('n', ';bt', gs.toggle_current_line_blame)
-- map('n', ';d', gs.diffthis)
-- map('n', ';D', function() gs.diffthis('~') end)
-- map('n', ';t', gs.toggle_deleted)
-- -- text object
-- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', options)

-- debugging ----------------------------------------------

-- barbar -------------------------------------------------
local barbar_opts = { noremap = true, silent = true, nowait = true }
-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', barbar_opts)
map('n', '<A-.>', ':BufferNext<CR>', barbar_opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', barbar_opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', barbar_opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', barbar_opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', barbar_opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', barbar_opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', barbar_opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', barbar_opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', barbar_opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', barbar_opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', barbar_opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', barbar_opts)
map('n', '<A-0>', ':BufferLast<CR>', barbar_opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', barbar_opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
map('n', '<Space>bc', ':BufferCloseAllButCurrent<CR>', barbar_opts)
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>

-- telescope fuzzy finder ---------------------------------
-- File pickers
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>", options)
map('n', '<leader>fb', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR><esc>", options)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('  : ')})<cr>", options)
map('n', '<leader>fl', "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
-- Misc
map('n', '<leader><space>t', "<cmd>lua require('telescope.builtin').treesitter()<cr>", options)
map('n', '<leader><space>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
map('n', '<leader><space>h', "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
map('n', '<leader><space>r', "<cmd>lua require('telescope.builtin').lsp_references()<cr>", options)
map('n', '<leader><space>d', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", options)
map('n', '<leader><space>q', "<cmd>lua require('telescope.builtin').quickfix()<cr>", options)
map('n', '<leader><space>l', "<cmd>lua require('telescope.builtin').loclist()<cr>", options)
map('n', '<leader><space>s', "<cmd>lua require('telescope.builtin').search_history()<cr>", options)
-- Git pickers
map('n', '<leader><space>gd', "<cmd>GDiff<cr>", options)
map('n', '<leader><space>gc', "<cmd>lua require('telescope.builtin').git_commits()<cr>", options)
map('n', '<leader><space>gb', "<cmd>lua require('telescope.builtin').git_branches()<cr>", options)
map('n', '<leader><space>gh', "<cmd>lua require('telescope.builtin').git_stash()<cr>", options)
map('n', '<leader><space>gs', "<cmd>lua require('telescope.builtin').git_status()<cr>", options)
-- Vim pickers
map('n', '<leader><space>vo', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
map('n', '<leader><space>vc', "<cmd>lua require('telescope.builtin').commands()<cr>", options)
map('n', '<leader><space>vr', "<cmd>lua require('telescope.builtin').registers()<cr>", options)
map('n', '<leader><space>vs', "<cmd>lua require('telescope.builtin').colorscheme()<cr>", options)
