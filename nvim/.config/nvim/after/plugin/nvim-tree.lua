local function nvim_tree_toggle_project()
    vim.cmd('lcd ' .. vim.g.project_path)
    require 'nvim-tree'.toggle()
end

local function grep_at_current_tree_node()
    local node = require('nvim-tree.lib').get_node_at_cursor()
    if not node then return end
    require('telescope.builtin').live_grep({ search_dirs = { node.absolute_path } })
end

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
    diagnostics         = {
        enable = true,
    },
}
