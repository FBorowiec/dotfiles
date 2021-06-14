" Which-key settings

" Setting space as the leader ley
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" By default timeoutlen is 1000 ms
set timeoutlen=500

" Minimal configuration with <Space> and <,> as 'leader' and 'local leader'
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" Define prefix dictionary
let g:which_key_map =  {}
