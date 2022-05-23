-- relative line numbering
vim.opt.relativenumber = true
vim.opt.number = true

-- indentation
vim.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- enable mouse in all modes - are you out of your mind?
-- vim.opt.mouse = "a"

-- misc
vim.opt.nu = true
vim.opt.nowrap = true
vim.opt.noswapfile = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.noerrorbells = true -- disable error bells
vim.opt.clipboard = "unnamed,unnamedplus" -- use + registers for clipboard
vim.opt.cursorline = true -- highlight current line
vim.opt.encoding = "utf-8" -- use UTF-8 encoding

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true

-- backup
vim.opt.nobackup = true
vim.opt.undodir = "~/.config/nvim/undodir"
vim.opt.undofile = true

-- more space for messages
vim.opt.cmdheight = 2
vim.opt.scrolloff = 16

-- colors
vim.opt.colorcolumn = 120
vim.cmd([[highlight Colorcolumn ctermbg=0]])
vim.cmd([[highlight Normal guibg=none]])

-- focus on new splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- timeout length
vim.opt.timeoutlen = 400

-- refresh buffers automatically
vim.opt.autoread = true

-- no space when concating
vim.opt.nojoinspaces = true
