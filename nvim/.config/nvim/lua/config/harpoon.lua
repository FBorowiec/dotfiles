local M = {}

function M.setup()
    require("harpoon").setup({
        menu = {
            width = 140,
            height = 30,
        }
    })
end

return M
