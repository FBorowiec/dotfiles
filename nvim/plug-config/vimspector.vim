let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
syntax enable
filetype plugin indent on

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

nnoremap <F5> <Plug>VimspectorContinue
nnoremap <S-F5> <Plug>VimspectorStop
nnoremap <C-S-F5> <Plug>VimspectorRestart
nnoremap <F6> <Plug>VimspectorPause
nnoremap <F9> <Plug>VimspectorToggleBreakpoint
nnoremap <S-F9> <Plug>VimspectorAddFunctionBreakpoint
nnoremap <F10> <Plug>VimspectorStepOver
nnoremap <F11> <Plug>VimspectorStepInto
nnoremap <S-F11> <Plug>VimspectorStepOut
