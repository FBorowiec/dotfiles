hi link LspDiagnosticsVirtualTextError Red
hi link LspDiagnosticsVirtualTextWarning Yellow
hi link LspDiagnosticsUnderlineError Red
hi link LspDiagnosticsUnderlineWarning Yellow

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1

" Enable preview window with auto close
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:asyncomplete_auto_popup = 1

" Avoid showing message extra message when using completion
set shortmess+=c

nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>lr :LspRestart<CR>
nnoremap <leader>ls :LspStop<CR>
nnoremap <leader>lq :lua vim.lsp.diagnostic.set_qflist()<CR>

" let LspInstall python cpp
