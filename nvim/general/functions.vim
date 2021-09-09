" Trimming whitespaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_ON_SAVE
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Macros over visual range
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Clang format cpp files
function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()

" Format jsons
function FormatJsonBuffer()
  if &modified
    let cursor_pos = getpos('.')
    :%!python -m json.tool
    call setpos('.', cursor_pos)
  endif
endfunction

autocmd BufWritePre *.json :call FormatJsonBuffer()

" Vimspector json
function! StartVimspector(job_id, code, event) dict
    if a:code == 0
        close
        call vimspector#Launch()
    endif
endfun

" Fast switching between source and header files for cpp
function! SwitchSourceHeader()
    let filepath = expand('%:p:h')
    let filename = expand('%:t:r')
    let fileending = expand('%:e')
    if (fileending == "cpp")
        let filetype = ".h*"
        if (stridx(filepath, "/src"))
            let filepath = split(filepath, "/src")[0] . "/**/"
        endif
    endif
    if (fileending == "hpp" || fileending == "h")
        let filetype = ".cpp"
        if (stridx(filepath, "/include"))
            let filepath = split(filepath, "/include")[0] . "/**/"
        endif
    endif
    exec "find " . filepath . filename . filetype
endfun

map <F2> ma :call SwitchSourceHeader()<cr>'a

" Quick navigation over errors using loclist
function! LspLocationList()
    lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun

augroup LOCLIST_LSP
    autocmd!
    autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
augroup END
