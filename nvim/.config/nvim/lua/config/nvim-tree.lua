local M = {}

function M.nvim_tree_find_file()
    local function starts_with(String, Start)
        return string.sub(String, 1, string.len(Start)) == Start
    end

    local cur_path = vim.fn.expand('%:p:h')

    if starts_with(cur_path, vim.g.project_path) then
        require('nvim-tree').find_file(true)
    else
        require('nvim-tree').refresh()
        require('nvim-tree.lib').change_dir(cur_path)
        require('nvim-tree').find_file(true)
    end
end

function M.nvim_tree_toggle_project()
    vim.cmd('lcd ' .. vim.g.project_path)
    require 'nvim-tree'.toggle()
end

function M.grep_at_current_tree_node()
    local node = require('nvim-tree.lib').get_node_at_cursor()
    if not node then return end
    require('telescope.builtin').live_grep({ search_dirs = { node.absolute_path } })
end

function M.setup()
    vim.g.project_path = vim.fn.getcwd()
    require 'nvim-tree'.setup {
        open_on_setup       = true,
        sort_by             = "case_sensitive",
        view                = {
            adaptive_size = false,
            width = 42,
            mappings = {
                custom_only = false,
                list = { key = "u", action = "dir_up" },
            },
            relativenumber = true,
        },
        renderer            = {
            group_empty = true,
        },
        filters             = {
            dotfiles = false,
            custom = { "^.git$" }
        },
        update_focused_file = {
            enable      = true,
            update_cwd  = true,
            ignore_list = { ".git", ".git/" }
        },
    }
end

return M
