local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

function M.setup()
    require("null-ls").setup({
        sources = {
            -- ansible-lint
            require("null-ls").builtins.diagnostics.ansiblelint.with({
                condition = function()
                    return vim.fn.executable("ansible-lint") > 0
                end,
            }),
            -- bazel
            require("null-ls").builtins.diagnostics.buildifier,
            require("null-ls").builtins.formatting.buildifier.with({
                condition = function()
                    return vim.fn.executable("buildifier") > 0
                end,
            }),
            -- cpp
            require("null-ls").builtins.formatting.clang_format,
            require("null-ls").builtins.formatting.cmake_format,
            -- github actions workflow files
            require("null-ls").builtins.diagnostics.actionlint,
            -- git
            require("null-ls").builtins.diagnostics.gitlint,
            -- json
            require("null-ls").builtins.diagnostics.jsonlint.with({
                condition = function()
                    return vim.fn.executable("jsonlint") > 0
                end,
            }),
            require("null-ls").builtins.formatting.fixjson.with({
                condition = function()
                    return vim.fn.executable("fixjson") > 0
                end,
            }),
            require("null-ls").builtins.formatting.json_tool.with({
                condition = function()
                    return vim.fn.executable("python3") > 0
                end,
            }),
            -- lua
            require("null-ls").builtins.diagnostics.luacheck,
            require("null-ls").builtins.formatting.stylua,
            -- markdown
            require("null-ls").builtins.diagnostics.mdl,
            -- python
            -- require("null-ls").builtins.diagnostics.mypy,
            require("null-ls").builtins.formatting.black,
            require("null-ls").builtins.formatting.isort,
            -- sh
            require("null-ls").builtins.diagnostics.shellcheck,
            require("null-ls").builtins.diagnostics.zsh,
            require("null-ls").builtins.formatting.shfmt,
            require("null-ls").builtins.formatting.shellharden,
            -- sql
            -- require("null-ls").builtins.diagnostics.pg_format,
            require("null-ls").builtins.formatting.pg_format,
            require("null-ls").builtins.formatting.sqlfluff.with({
                extra_args = { "--dialect", "postgres" }
            }),
            require("null-ls").builtins.diagnostics.sqlfluff.with({
                extra_args = { "--dialect", "postgres" }
            }),
            -- misc
            require("null-ls").builtins.formatting.trim_newlines,
            require("null-ls").builtins.formatting.trim_whitespace,
            -- yaml
            require("null-ls").builtins.diagnostics.yamllint.with({
                condition = function()
                    return vim.fn.executable("yamllint") > 0
                end,
            }),
        },
        on_attach = on_attach,
    })
end

return M
