local M = {}

function M.setup()
    local util = require('lspconfig.util')
    require 'lspconfig'.pyright.setup {
        cmd = { "pyright" },
        filetypes = { "python" },
        root_dir = function(fname)
            local root_files = {
                '.git',
                'pyproject.toml',
                'setup.py',
                'setup.cfg',
                'Pipfile',
            }
            return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or
                util.path.dirname(fname)
        end
    }
    require 'lspconfig'.bashls.setup {}
end

return M
