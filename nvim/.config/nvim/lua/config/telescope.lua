local M = {}

function M.setup()
    require('telescope').setup {
        defaults = {
            file_sorter          = require('telescope.sorters').get_fzy_sorter,
            prompt_prefix        = '  : ',
            color_devicons       = true,
            file_previewer       = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer       = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer     = require('telescope.previewers').vim_buffer_qflist.new,
            file_ignore_patterns = { ".git/" },
            vimgrep_arguments    = {
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
            mappings             = {
                i = {
                    ["<C-x>"] = false,
                    ["<C-q>"] = require('telescope.actions').send_to_qflist,
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                }
            }
        }
    }
    require('telescope').load_extension('file_browser')
end

return M
