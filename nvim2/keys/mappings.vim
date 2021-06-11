" Basic Key-bindings

" Better indenting
vnoremap < <gv
vnoremap > >gv

" alias for 'escape' to NORMAL from INSERT
inoremap jk <Esc>

" Explore
nnoremap <Space>. :Sex!<CR>
nnoremap <Space><Space> :Files<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" move lines using 'Alt', vscode-like
nnoremap <M-Up> :move -2<CR>
nnoremap <M-Down> :move +1<CR>
