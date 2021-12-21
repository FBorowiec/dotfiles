require("harpoon").setup({
    menu = {
        width = 120,
        height = 40,
    }
})

vim.api.nvim_set_keymap('n', '<leader>h', ':lua require("harpoon.mark").add_file()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })
