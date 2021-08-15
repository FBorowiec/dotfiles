" Find files using Telescope command-line sugar.

" File pickers
" nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files{}<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>fp <cmd>lua require('telescope.builtin').lsp_definitions()<cr>

" Git pickers
nnoremap <leader>ftc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>ftb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fts <cmd>lua require('telescope.builtin').git_stash()<cr>
nnoremap <leader>ftt <cmd>lua require('telescope.builtin').git_status()<cr>

" Vim pickers
nnoremap <leader>fvb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fvo <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fvc <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>fvh <cmd>lua require('telescope.builtin').search_history()<cr>
nnoremap <leader>fvq <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>fvl <cmd>lua require('telescope.builtin').loclist()<cr>
nnoremap <leader>fvr <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader>fvs <cmd>lua require('telescope.builtin').colorscheme()<cr>

lua << EOF
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,
        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--ignore-file',
            '.gitignore'
        },

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = require('telescope.actions').send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF
