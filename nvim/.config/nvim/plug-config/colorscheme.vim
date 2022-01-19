if has('termguicolors')
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
set background=dark
syntax on

" Gruvbox ----------------------
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 1
" let g:gruvbox_material_disable_italic_comment = 1
" let g:gruvbox_material_enable_bold = 1

" NVCode -----------------------
" colorscheme nvcode
" let g:nvcode_termcolors=256
" let g:airline_theme='bubblegum'

" Onedark ----------------------
" colorscheme onedark
" let g:airline_theme='onedark'

" Nord -------------------------
colorscheme nord
let g:airline_theme='base16_nord'

" Transparency
highlight Normal guibg=none
