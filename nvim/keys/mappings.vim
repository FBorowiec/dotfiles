" Basic Key-bindings

" Leader key to space
let mapleader=" "

" Better indenting
vnoremap < <gv
vnoremap > >gv

" alias for 'escape' to NORMAL from INSERT
inoremap jk <Esc>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" move lines using 'Alt', vscode-like
nnoremap <M-Up> :move -2<CR>
nnoremap <M-Down> :move +1<CR>

" Tabbing and un-tabbing chunks of text
" inoremap <leader><S-Tab> <C-O><lt><lt>
" nnoremap <leader><Tab> >>
" nnoremap <leader><S-Tab> <lt><lt>
" vnoremap <leader><Tab> >
" vnoremap <leader><S-Tab> <lt>

" Faster writing / quitting
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>

" Nohighlight
map <leader>noh :nohlsearch<cr>

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
vnoremap J :m ''>+1<CR>gv=gv
vnoremap K :m ''<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
" have to remap easymotion
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==
