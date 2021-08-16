" TELESCOPE ----------------------------------------------------
" File pickers
" nnoremap <c-p> <cmd>lua require('telescope.builtin').find_files{}<cr>
nnoremap <leader><space>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader><space>fg <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>
nnoremap <leader><space>fl <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader><space>t <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader><space>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader><space>h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader><space>r <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader><space>d <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <leader><space>q <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader><space>s <cmd>lua require('telescope.builtin').search_history()<cr>

" Git pickers
nnoremap <leader><space>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader><space>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader><space>gh <cmd>lua require('telescope.builtin').git_stash()<cr>
nnoremap <leader><space>gs <cmd>lua require('telescope.builtin').git_status()<cr>

" Vim pickers
nnoremap <leader><space>vo <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader><space>vc <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader><space>vl <cmd>lua require('telescope.builtin').loclist()<cr>
nnoremap <leader><space>vr <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader><space>vs <cmd>lua require('telescope.builtin').colorscheme()<cr>

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
