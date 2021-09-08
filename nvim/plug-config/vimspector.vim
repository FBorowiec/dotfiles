" let g:vimspector_enable_mappings = 'HUMAN'
syntax enable
filetype plugin indent on

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

nnoremap <F5> :NvimTreeClose<cr> <bar> :call vimspector#Continue()<cr>
nnoremap <leader><F5> :call vimspector#Reset()<cr>
nnoremap <F3> :call vimspector#Stop()<cr>
nnoremap <F4> :call vimspector#Restart()<cr>
nnoremap <F6> :call vimspector#Pause()<cr>
nnoremap <F9> :call vimspector#ToggleBreakpoint()<cr>
nnoremap <F8> :call vimspector#AddFunctionBreakpoint()<cr>
nnoremap <leader><F8> :call vimspector#RunToCursor()<cr>
nnoremap <F10> :call vimspector#StepOver()<cr>
nnoremap <F11> :call vimspector#StepInto()<cr>
nnoremap <F12> :call vimspector#StepOut()<cr>
