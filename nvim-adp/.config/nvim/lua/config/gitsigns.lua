local M = {}

function M.setup()
    require('gitsigns').setup{
      on_attach = function(bufnr)
    }
end

return M
