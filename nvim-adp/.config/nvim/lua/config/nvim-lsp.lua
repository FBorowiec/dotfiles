local M = {}
function M.setup()
    local servers = { "clangd", "pyright", "bashls" }
    require("nvim-lsp-installer").setup({ automatic_installation = true})

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    capabilities.offsetEncoding = { "utf-16" }

    for _, server in pairs(servers) do
        local config = {
            capabilities = capabilities,
        }
        if server == "pyright" then
            config.settings = { python = { analysis = { extraPaths = { vim.fn.getcwd() } } } }
        end
        if server == "clangd" then
            local install_path = {require'nvim-lsp-installer.servers'.get_server('clangd')}
            if install_path[1] then
                install_path = install_path[2].root_dir
                config.cmd = {install_path .. "/clangd/bin/clangd", "--background-index", "--cross-file-rename"};
             end
        end
        require('lspconfig')[server].setup(config)
    end

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl })
    end

end

return M
