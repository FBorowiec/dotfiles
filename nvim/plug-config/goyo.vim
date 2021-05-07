" Goyo
" while Entering Goyo mode
function! s:goyo_enter()
    set number relativenumber
endfunction

" while Entering Goyo mode

function! s:goyo_leave()
  " ...
endfunction

" Mapping 'enter' and 'leave' functions

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
