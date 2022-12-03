local M = {}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/?.lua")
table.insert(runtime_path, "lua/?/?/?.lua")

local lua_settings = {
    Lua = {
        runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
    },
}

local pyright_settings = {
    settings = {
        python = {
            analysis = {
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "strict"
            }
        }
    }
}

function M.setup()
    local servers = {
        "ansiblels",
        "awk_ls",
        "bashls",
        "clangd",
        "cmake",
        "cssls",
        "cssmodules_ls",
        "dockerls",
        "dotls",
        "elixirls",
        "elmls",
        "emmet_ls",
        "eslint",
        "glint",
        "golangci_lint_ls",
        "gopls",
        "gradle_ls",
        "grammarly",
        "graphql",
        "groovyls",
        "html",
        "jsonls",
        "jsonnet_ls",
        "kotlin_language_server",
        "ltex",
        "luau_lsp",
        "marksman",
        "opencl_ls",
        "perlnavigator",
        "prosemd_lsp",
        "purescriptls",
        "pyright",
        "quick_lint_js",
        "rust_analyzer",
        "solang",
        "solc",
        "solidity",
        "sqlls",
        "sqls",
        "stylelint_lsp",
        "sumneko_lua",
        "terraformls",
        "texlab",
        "tflint",
        "tsserver",
        "vimls",
        "yamlls",
    }
    require("mason").setup()
    require("mason-lspconfig").setup({ ensure_installed = servers, automatic_installation = true })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    capabilities.offsetEncoding = { "utf-16" }

    for _, server in pairs(servers) do
        local config = { capabilities = capabilities }
        if server == "sumneko_lua" then
            config.settings = lua_settings
        end
        if server == "pyright" then
            config.settings = pyright_settings
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
