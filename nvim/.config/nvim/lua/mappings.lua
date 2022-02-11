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

-- insert an empty line above / below
map('n', '<leader>o', 'o<esc>', options)
map('n', '<leader>O', 'O<esc>', options)

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

-- Make current file executable
map('n', '<leader>x', ':!chmod +x %<cr>', options)

-- Plugins
map('n', '<C-p>', ':NvimTreeToggle<cr>:NvimTreeRefresh<cr>', options)

-- Bazel
-- autocmd FileType bzl nnoremap <buffer> gd :call GoToBazelDefinition()<CR>
map('n', 'gbt', ':call GoToBazelTarget()<CR>', options)
map('n', '<Leader>Bt',  ':call RunBazelHere("test " . g:bazel_config . " -c opt" )<CR>', options)
map('n', '<Leader>Bb',  ':call RunBazelHere("build " . g:bazel_config . " -c opt")<CR>', options)
map('n', '<Leader>Bdb', ':call RunBazelHere("build " . g:bazel_config . " -c dbg")<CR>', options)
map('n', '<Leader>Bl',  ':call RunBazel()<CR>', options)

-- DebugThisTest for cpp files
map('n', '<leader>bdt',  ":lua  require'config.bazel'.DebugThisTest()<CR>" , options)

-- Debugging
map('n', '<leader>Dt', ':lua require("dapui").toggle()<CR>', options)
map('n', '<leader>D<space>', ":lua require'dap'.continue()<CR>", options)
map('n', '<leader>Dp', ":lua require'dap'.toggle_breakpoint()<CR>", options)
map('n', '<leader>Dl', ":lua require'dap'.step_into()<CR>", options)
map('n', '<leader>Dj', ":lua require'dap'.step_over()<CR>", options)
map('n', '<leader>Dk', ":lua require'dap'.step_out()<CR>", options)
map('n', '<leader>Dc', ":lua require'dap'.run_to_cursor()<CR>", options)
map('n', '<leader>De', ":lua require'dap'.close()<CR>", options)
map('n', '<leader>Dd', ":Telescope dap commands<CR>", options)
map('n', '<leader>Df', ":Telescope dap frames<CR>", options)
map('n', '<leader>Dr', ":lua require'dap'.repl.open()<CR>", options)
map('n', '<leader>Dh', ":lua require('dap.ui.widgets').hover()<CR>", options)
map('n', '<leader>Ds', ":lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).toggle()<CR>", options)
map('n', '<leader>Dw', ":lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').expression).toggle()<CR>", options)
