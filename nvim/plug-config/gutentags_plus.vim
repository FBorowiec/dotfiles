" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['WORKSPACE']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_plus_nomap = 1
noremap <leader>gs :GscopeFind s <C-R><C-W><cr> " Find symbol (reference) under cursor
noremap <leader>gg :GscopeFind g <C-R><C-W><cr> " Find symbol definition under cursor
noremap <leader>gd :GscopeFind d <C-R><C-W><cr> " Functions called by this function
noremap <leader>gc :GscopeFind c <C-R><C-W><cr> " Functions calling this function
noremap <leader>gt :GscopeFind t <C-R><C-W><cr> " Find text string under cursor
noremap <leader>ge :GscopeFind e <C-R><C-W><cr> " Find egrep pattern under cursor
noremap <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr> " Find file name under cursor
noremap <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr> " Find files #including the file name under cursor
noremap <leader>ga :GscopeFind a <C-R><C-W><cr> " Find places where current symbol is assigned
noremap <leader>gz :GscopeFind z <C-R><C-W><cr> " Find current word in ctags database

