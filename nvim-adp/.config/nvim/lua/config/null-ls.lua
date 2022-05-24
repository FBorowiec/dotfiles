local M = {}

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(clients)
            -- filter out clients that you don't want to use
            return vim.tbl_filter(function(client)
                return client.name ~= "clangd"
            end, clients)
        end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

function M.setup()
    require("null-ls").setup({
        sources = {
            require("null-ls").builtins.formatting.black,
            require("null-ls").builtins.formatting.buildifier,
            require("null-ls").builtins.formatting.clang_format,
            require("null-ls").builtins.formatting.isort,
            require("null-ls").builtins.formatting.json_tool,
            require("null-ls").builtins.formatting.stylua,
            require("null-ls").builtins.formatting.trim_newlines,
            require("null-ls").builtins.formatting.trim_whitespace,
        },
        on_attach = on_attach,
    })
end

return M
