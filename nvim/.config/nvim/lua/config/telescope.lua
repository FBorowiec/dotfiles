-- File pickers
local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>", options)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('  : ')})<cr>", options)
map('n', '<leader>fl', "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)

-- Misc
map('n', '<leader><space>t', "<cmd>lua require('telescope.builtin').treesitter()<cr>", options)
map('n', '<leader><space>b', "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
map('n', '<leader><space>h', "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
map('n', '<leader><space>r', "<cmd>lua require('telescope.builtin').lsp_references()<cr>", options)
map('n', '<leader><space>d', "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", options)
map('n', '<leader><space>q', "<cmd>lua require('telescope.builtin').quickfix()<cr>", options)
map('n', '<leader><space>l', "<cmd>lua require('telescope.builtin').loclist()<cr>", options)
map('n', '<leader><space>s', "<cmd>lua require('telescope.builtin').search_history()<cr>", options)

-- Git pickers
map('n', '<leader><space>gd', "<cmd>GDiff<cr>", options)
map('n', '<leader><space>gc', "<cmd>lua require('telescope.builtin').git_commits()<cr>", options)
map('n', '<leader><space>gb', "<cmd>lua require('telescope.builtin').git_branches()<cr>", options)
map('n', '<leader><space>gh', "<cmd>lua require('telescope.builtin').git_stash()<cr>", options)
map('n', '<leader><space>gs', "<cmd>lua require('telescope.builtin').git_status()<cr>", options)

-- Vim pickers
map('n', '<leader><space>vo', "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
map('n', '<leader><space>vc', "<cmd>lua require('telescope.builtin').commands()<cr>", options)
map('n', '<leader><space>vr', "<cmd>lua require('telescope.builtin').registers()<cr>", options)
map('n', '<leader><space>vs', "<cmd>lua require('telescope.builtin').colorscheme()<cr>", options)


local M = {}

function M.setup()
    require('telescope').setup {
        defaults = {
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            prompt_prefix = '  : ',
            color_devicons = true,
            file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--hidden',
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
end

return M
