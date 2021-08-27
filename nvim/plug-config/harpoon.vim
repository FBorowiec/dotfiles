nnoremap <leader>h :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>

lua << EOF
require("harpoon").setup({
    menu = {
        width = 120,
        height = 40,
    }
})
EOF

" Optional
" nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>
" nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<CR>
" nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>
" nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>
" nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
" nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>
" nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>
" nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>
