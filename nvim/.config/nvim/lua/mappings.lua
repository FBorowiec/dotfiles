-- GENERAL ---------------------------------------------------------------------
local map = vim.keymap.set

-- map the leader key
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables
map('n', 'Q', '', {}) -- disable 'Q'

local options = { noremap = true }

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
map('n', '<leader>Q', ':qa!<cr>', options)

-- toggle nohighlight
map('n', '<leader>nh', ':nohlsearch<cr>', options)

-- Make Y behave like other capital letters (C, D)
map('n', 'Y', 'y$', options)

-- deletes visual selection and pastes without changing default register
map('v', 'p', '"_dP', options)

-- copy to system clipboard
map('n', '<leader>y', '"+y', options)
map('v', '<leader>y', '"+y', options)
map('n', '<leader>Y', '"+y$', options)

-- paste from system clipboard
map('n', '<leader>p', '"+p', options)
map('v', '<leader>p', '"+p', options)

-- move to void register
map('n', '<leader>d', '"_d', options)
map('v', '<leader>d', '"_d', options)

-- go to first file on line
map('n', 'gf', '^f/gf', options)

-- Keeping it centered while iterating through results with n
map('n', 'n', 'nzzzv', options)
map('n', 'N', 'Nzzzv', options)
map('n', 'J', 'mzJ`z', options)

-- Keeping it centered while moving halp page up/down
map('n', '<C-u>', '<C-u>zz', options)
map('n', '<C-d>', '<C-d>zz', options)

-- Moving text
map('v', 'J', ':m \'>+1<CR>gv=gv', options)
map('v', 'K', ':m \'<-2<CR>gv=gv', options)
map('i', '<C-j>', '<Esc>:m .+1<cr>==', options)
map('i', '<C-k>', '<Esc>:m .-2<cr>==', options)

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quickfix and Location list
map('n', '<C-j>', ':cnext<cr>zz', options)
map('n', '<C-k>', ':cprev<cr>zz', options)
map('n', '<leader><space>j', ':lnext<cr>zz', options)
map('n', '<leader><space>k', ':lprev<cr>zz', options)

-- Close all splits and go to last window
map('n', '<leader>;q', '<C-w><C-O>', options)

-- Quick window resize
map('n', '<leader>+', ':exe "resize " . (winheight(0) * 3/2)<cr>', options)
map('n', '<leader>-', ':exe "resize " . (winheight(0) * 2/3)<cr>', options)

-- Make current file executable
map('n', '<leader>x', ':!chmod +x %<cr>', options)

-- Quick rename
map("n", "<leader><leader>rn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- FUNCTIONS -------------------------------------------------------------------
-- switch between cpp header and source file
map('n', '<F2>', vim.fn.SwitchSourceHeader, options)
map('n', '<F1>', vim.fn.ToggleTransparency, options)

-- PLUGINS ---------------------------------------------------------------------
-- LSP
map('n', '<leader>rn', vim.lsp.buf.rename, options)
map('n', '<leader>rl', "<cmd>lua require('telescope.builtin').lsp_references()<cr>", options) -- telescope
-- vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, options) -- replaced by telescope version
map('n', '<leader>ca', vim.lsp.buf.code_action, options)
map('n', '<leader>lr', ':LspRestart<cr>', options)
map('n', '[d', vim.diagnostic.goto_prev, options)
map('n', ']d', vim.diagnostic.goto_next, options)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options) -- replaced by telescope version
map('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", options) -- telescope
map('n', 'gD', vim.lsp.buf.declaration, options) -- [g]o to [D]eclaration
map('n', 'gi', vim.lsp.buf.implementation, options)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, options) -- replaced by telescope
map('n', '<leader>ds', "<cmd>lua require('telescope.builtin').lsp_document_symbols<cr>", options)

-- TELESCOPE FUZZY FINDER ---------------------------------
-- file pickers
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>", options)
map('n', '<leader>fb', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR><esc>", options)
-- "plugin" --iglob nvim/** --iglob !nvim/.config/nvim/lua
map('n', '<leader>fl', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", options)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
-- misc
map('n', '<leader><space>t', "<cmd>lua require('telescope.builtin').treesitter()<cr>", options)
map('n', '<leader><space>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
map('n', '<leader><space>h', "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
map('n', '<leader><space>q', "<cmd>lua require('telescope.builtin').quickfix()<cr>", options)
map('n', '<leader><space>l', "<cmd>lua require('telescope.builtin').loclist()<cr>", options)
map('n', '<leader><space>s', "<cmd>lua require('telescope.builtin').search_history()<cr>", options)
-- git pickers
map('n', '<leader><space>gd', "<cmd>Gdiffsplit<cr>", options)
map('n', '<leader><space>gD', "<cmd>0Gclog<cr>", options)
map('n', '<leader><space>gc', "<cmd>lua require('telescope.builtin').git_commits()<cr>", options)
map('n', '<leader><space>gb', "<cmd>lua require('telescope.builtin').git_branches()<cr>", options)
map('n', '<leader><space>gh', "<cmd>lua require('telescope.builtin').git_stash()<cr>", options)
map('n', '<leader><space>gs', "<cmd>lua require('telescope.builtin').git_status()<cr>", options)
-- vim pickers
map('n', '<leader><space>vo', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
map('n', '<leader><space>vc', "<cmd>lua require('telescope.builtin').commands()<cr>", options)
map('n', '<leader><space>vr', "<cmd>lua require('telescope.builtin').registers()<cr>", options)
map('n', '<leader><space>vt', "<cmd>lua require('telescope.builtin').colorscheme()<cr>", options)

-- NVIMTREE -----------------------------------------------
map('n', '<C-p>', ':NvimTreeToggle<cr>:NvimTreeCollapse<cr>', options) -- toggle Nvim Tree
map('n', '<leader>nt', ':nvim_tree_find_file()<cr>', options)

-- FLOATERM -----------------------------------------------
vim.g.floaterm_keymap_toggle = "<leader>tt" -- toggle terminal
vim.g.floaterm_keymap_prev   = "<leader>tp" -- next terminal
vim.g.floaterm_keymap_next   = "<leader>tn" -- previous terminal
vim.g.floaterm_keymap_new    = "<leader>tf" -- create new terminal window

-- HARPOON ------------------------------------------------
map('n', '<S-h>', ":lua require('harpoon.mark').add_file()<cr>", options)
map('n', '<C-h>', ":lua require('harpoon.ui').toggle_quick_menu()<cr>", options)
map('n', '<leader>j', ":lua require('harpoon.ui').nav_next()<cr>", options) -- navigates to next mark
map('n', '<leader>k', ":lua require('harpoon.ui').nav_prev()<cr>", options) -- navigates to previous mark

-- UNDOTREE -----------------------------------------------
map('n', '<leader>u', ':Telescope undo<cr>', options)

-- MARKDOWN PREVIEW ---------------------------------------
map('n', '<leader><space>mp', ':MarkdownPreviewToggle<cr>', options)
map('n', '<leader><space>mi', ':call mkdp#util#install()<cr>', options)

-- MAXIMIZER ----------------------------------------------
map('n', '<leader>m', ':MaximizerToggle!<cr>', options)

-- GIT FUGITIVE -------------------------------------------
map('n', '<leader>gj', ':diffget //3<cr>', options)
map('n', '<leader>gf', ':diffget //2<cr>', options)
map('n', '<leader>gs', ':G<cr>', options) -- gv on a file (inside the status menu) to resolve conflicts
map('n', '<leader>gb', ':Git blame<cr>', options)
map('n', '<leader>gd', ':Gdiffsplit<cr>', options)

-- GITSIGNS -----------------------------------------------
-- see config/gitsigns.lua

-- BAZEL --------------------------------------------------
-- vim.api.nvim_create_autocmd("FileType",
-- { pattern = "bzl", callback = function() map('n', 'gd', vim.fn.GoToBazelDefinition, { buffer = 0 }) end }) -- breaks
map('n', 'gbt', vim.fn.GoToBazelTarget)
map('n', '<leader>bl', vim.fn.RunBazel)
map('n', '<leader>bd', ':DebugThisTest()<cr>')
map('n', '<leader>by', ':YankLabel()<cr>')
map('n', '<leader>bt', function() vim.fn.RunBazelHere("test " .. vim.g.bazel_config .. " -c opt") end)
map('n', '<leader>bb', function() vim.fn.RunBazelHere("build " .. vim.g.bazel_config .. " -c opt") end)
map('n', '<leader>br', function() vim.fn.RunBazelHere("run " .. vim.g.bazel_config .. " -c opt") end)
map('n', '<leader>bs', function() vim.fn.RunBazelHere("build " .. vim.g.bazel_config .. " -c dbg ") end)

-- DEBUGGING ----------------------------------------------
local dap = require 'telescope'.extensions.dap
map('n', '<leader>dt', require 'dapui'.toggle)
map('n', '<leader>db', require 'dap'.toggle_breakpoint)
map('n', '<leader>dB', ":lua require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", options)
map('n', '<F5>', require 'dap'.continue)
map('n', '<F10>', require 'dap'.step_over)
map('n', '<F11>', require 'dap'.step_into)
map('n', '<F12>', require 'dap'.step_out)
map('n', '<F6>', require 'dap'.run_to_cursor)
map('n', '<leader>df', dap.frames)
map('n', '<leader>dc', dap.commands)
map('n', '<leader>de', ':end_debug_session()')
-- map('n', '...', require'config.dap'.set_python_args_from_input)
-- map('n', '...', require'dap'.repl.open)
-- map('n', '...', require('dap.ui.widgets').hover)
-- map('n', '...', require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).toggle)
-- map('n', '...', require'dap'.run_last())
-- map('n', '...', require'dap'..set_breakpoint(nil, nil, vim.fn.input('Log point message: ')))

-- BARBAR -------------------------------------------------
local barbar_opts = { noremap = true, silent = true, nowait = true }
-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', barbar_opts)
map('n', '<A-.>', ':BufferNext<CR>', barbar_opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', barbar_opts)
map('n', '<A->>', ':BufferMoveNext<CR>', barbar_opts)
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
-- Close commands
map('n', '<A-/>', ':BufferClose<CR>', barbar_opts)
map('n', '<A-;>', ':BufferCloseAllButCurrent<CR>', barbar_opts)
-- map('n', '<A-l>', ':BufferCloseBuffersLeft<CR>', barbar_opts)
-- map('n', '<A-r>', ':BufferCloseBuffersRight<CR>', barbar_opts)

-- CHEATSHEET ---------------------------------------------
map('n', '<leader>?', ':Cheatsheet<cr>', options)

-- FOCUS --------------------------------------------------
map('n', '<c-l>', ':FocusToggle<CR>', { silent = true })

-- CHATGPT ------------------------------------------------
map('n', '<leader>fc', ':ChatGPT<cr>', options)
map('n', '<leader><leader>fc', ':ChatGPTActAs<cr>', options)
