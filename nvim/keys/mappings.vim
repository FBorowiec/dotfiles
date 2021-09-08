" BASIC KEY-BINDINGS -------------------------------------------

" Leader key to space
let mapleader=" "

" Better indenting
vnoremap < <gv
vnoremap > >gv

" alias for 'escape' to NORMAL from INSERT
inoremap jk <Esc>
inoremap jj <Esc>

" Move selected line / block of text in visual mode
" shift + k to move up
xnoremap K :move '<-2<CR>gv-gv
" shift + j to move down
xnoremap J :move '>+1<CR>gv-gv

" move lines using 'Alt', vscode-like
nnoremap <M-Up> :move -2<CR>
nnoremap <M-Down> :move +1<CR>

" Faster writing / quitting
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>

" Nohighlight
map <leader>nh :nohlsearch<cr>

" Make Y behave like other capital letters (C, D)
nnoremap Y y$

" Keeping it centered while iterating through results with n
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutations
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==

" have to remap easymotion
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==

" Quickfix and Location list
nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>
nnoremap <leader>j :lnext<cr>
nnoremap <leader>k :lprev<cr>

" Close all splits and go to last window
nnoremap ;q <C-w><C-O>
