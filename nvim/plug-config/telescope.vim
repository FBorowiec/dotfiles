" lua << EOF
" require('telescope').load_extension('fzy_native')
" require('telescope').setup {
"     defaults = {
"         file_sorter = require('telescope.sorters').get_fzy_sorter,
"         prompt_prefix = ' >',
"         color_devicons = true,
"         file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
"         grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
"         qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
"         mappings = {
"             i = {
"                 ["<C-x>"] = false,
"                 ["<C-q>"] = actions.send_to_qflist,
"             },
"         }
"     },
"     extensions = {
"         fzy_native = {
"           override_generic_sorter = false,
"           override_file_sorter = true,
"         }
"     }
" }
" EOF

" Find files using Telescope command-line sugar.
nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
