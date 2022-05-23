local util = require('lspconfig.util')
local root_files = {
    'pyproject.toml',
    '.git',
}

require'lspconfig'.pylsp.setup{
    cmd = { "pylsp" },
    filetypes = { "python" },
    root_dir = function(fname)
        local root_files = {
            '.git.',
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'Pipfile',
        }
        return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        },
        configurationSources = { "flake8_lint", "flake8", "black", "mypy", "isort" },
        pylsp = {
            plugins = {
                flake8 = {
                    enabled = true,
                    maxLineLength = 120,
                    ignore = {
                        'D100', -- Missing docstring in public module
                        'D101', -- Missing docstring in public class
                        'D105', -- Missing docstring in magic method
                        'D107', -- Missing docstring in __init__
                        'D200', -- One-line docstring should fit on one line with quotes
                        'D205', -- 1 blank line required between summary line and description
                        'D400', -- First line should end with a period
                        'D402', -- First line should not be the function's "signature"
                        'D401', -- First line should be in imperative mood
                        'N812', -- Lowercase imported as non lowercase (prevents `import torch.functionnal as F`)
                        'W503'  -- line break before binary operator
                    },
                },
                pylint = {
                    enabled = true,
                    -- https://vald-phoenix.github.io/pylint-errors/
                    executable = 'pylint',
                    args = {
                        '--disable ' ..
                        'C0115,' .. -- missing-class-docstring
                        'C0116,' .. -- missing-function-docstring
                        'R0903'     -- too-few-public-methods
                    }
                },
                pylsp_mypy = {
                    enabled = true,
                    live_mode = true
                },
                jedi_completion = {
                    enabled = true,
                    fuzzy = true
                },
                jedi_hover = {
                    enabled = true
                },
                jedi_references = {
                    enabled = true
                },
                jedi_signature_help = {
                    enabled = true
                },
                jedi_symbols = {
                    enabled = true,
                    all_scopes = true
                },
                pycodestyle = {
                    enabled = false
                },
                yapf = {
                    enabled = false
                },
                pyflakes = {
                    enabled = true
                },
                pydocstyle = {
                    enabled = false
                },
                mccabe = {
                    enabled = true
                },
                preload = {
                    enabled = true
                },
                rope_completion = {
                    enabled = true
                }
            },
            on_attach = on_attach
        }
    }
}

require'lspconfig'.bashls.setup{}
