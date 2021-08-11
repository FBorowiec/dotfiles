" let g:vimspector_enable_mappings = 'HUMAN'
syntax enable
filetype plugin indent on

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools' ]

nnoremap <leader>m :MaximizerToggle!
nnoremap <leader>dd :call vimspector#Launch()<cr>
nnoremap <leader>d<space> :call vimspector#Continue()<cr>
nnoremap <leader>de :call vimspector#Reset()<cr>

nnoremap <leader>dl <Plug>VimspectorStepInto
nnoremap <leader>dj <Plug>VimspectorStepOver
nnoremap <leader>dk <Plug>VimspectorStepOut
nnoremap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>dbp :call vimspector#ToggleBreakpoint()<cr>
nnoremap <leader>dbc <Plug>VimspectorClearBreakpoints
nnoremap <leader>dbt <Plug>VimspectorToggleConditionalBreakpoint
