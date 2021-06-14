" Sync open file with NERDTreeBufName
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinner(t:NERDTreeBufName) != 1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window containes a modifiable file, not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
