" formatting {{{
hi link LspDiagnosticsVirtualTextError Red
hi link LspDiagnosticsVirtualTextWarning Yellow
hi link LspDiagnosticsUnderlineError Red
hi link LspDiagnosticsUnderlineWarning Yellow
" }}}

" lspplugins {{{
lua require('lspkind').init()
" }}}

" server configs {{{
lua << EOF
require'lspinstall'.setup() -- important

local on_attach = function(client, bufnr)
  require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}

local util = require('lspconfig.util')

local function setup_servers()
    local servers = require'lspinstall'.installed_servers()
    for _, server in pairs(servers) do
        local config = {
            capabilities = capabilities,
            on_attach = on_attach,
        }
        if server == "lua" then
          config.settings = lua_settings
        end
        if server == "vim" then
            config.init_options = { runtimepath = vim.fn.expand("~/.vim/") .. "," .. vim.fn.expand("~/.config/nvim/") }
        end
        if server == "python" then
            config.settings = { python = { analysis = { extraPaths = { vim.fn.getcwd() } } } }
        end
        if server == "cpp" then
            config.cmd = {require"lspinstall.util".install_path("cpp") .. "/clangd/bin/clangd", "--background-index", "--cross-file-rename"};
            -- config.cmd = {require"lspinstall.util".install_path("cpp") .. "/clangd/bin/clangd", "--background-index", "--cross-file-rename", "--compile-commands-dir=" .. vim.fn.getcwd()};
        end
        require'lspconfig'[server].setup(config)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1

" Enable preview window with auto close
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:asyncomplete_auto_popup = 1

" Avoid showing message extra message when using completion
set shortmess+=c

nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d :lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>lr :LspRestart<CR>
nnoremap <leader>ls :LspStop<CR>
nnoremap <leader>lq :lua vim.lsp.diagnostic.set_qflist()<CR>

" let LspInstall python cpp
