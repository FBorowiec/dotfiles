local M = {}

function M.setup()
    -- require('telescope').load_extension('dap')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('media_files')
    require('telescope').load_extension('live_grep_args')
    local lga_actions = require("telescope-live-grep-args.actions")

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
                    ["<C-u>"] = false,
                    ["<C-d>"] = false,
                    ["<C-j><C-k>"] = require('telescope.actions').close,
                },
                n = {
                    ["<C-j><C-k>"] = require('telescope.actions').close,
                }
            }
        },
        extensions = {
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                mappings = { -- extend mappings
                    i = {
                        ["<C-k>"] = lga_actions.quote_prompt(),
                        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                    },
                },
                -- ... also accepts theme settings, for example:
                -- theme = "dropdown", -- use dropdown theme
                -- theme = { }, -- use own theme spec
                -- layout_config = { mirror=true }, -- mirror preview pane
            }
        }
    }
end

return M
