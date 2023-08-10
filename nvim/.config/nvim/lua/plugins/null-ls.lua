return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.diagnostics.ansiblelint)
      -- ansible-lint
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.ansiblelint.with({
          condition = function()
            return vim.fn.executable("ansible-lint") > 0
          end,
        })
      )
      -- bazel
      table.insert(opts.sources, nls.builtins.diagnostics.buildifier)
      table.insert(
        opts.sources,
        nls.builtins.formatting.buildifier.with({
          condition = function()
            return vim.fn.executable("buildifier") > 0
          end,
        })
      )
      -- cpp
      table.insert(opts.sources, nls.builtins.formatting.clang_format)
      table.insert(opts.sources, nls.builtins.formatting.cmake_format)
      -- github actions workflow files
      table.insert(opts.sources, nls.builtins.diagnostics.actionlint)
      -- git
      table.insert(opts.sources, nls.builtins.diagnostics.gitlint)
      -- javascript
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      -- json
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.jsonlint.with({
          condition = function()
            return vim.fn.executable("jsonlint") > 0
          end,
        })
      )
      table.insert(
        opts.sources,
        nls.builtins.formatting.fixjson.with({
          condition = function()
            return vim.fn.executable("fixjson") > 0
          end,
        })
      )
      table.insert(
        opts.sources,
        nls.builtins.formatting.json_tool.with({
          condition = function()
            return vim.fn.executable("python3") > 0
          end,
        })
      )
      -- lua
      table.insert(opts.sources, nls.builtins.diagnostics.luacheck)
      table.insert(opts.sources, nls.builtins.formatting.stylua)
      -- markdown
      table.insert(opts.sources, nls.builtins.diagnostics.mdl)
      -- python
      table.insert(opts.sources, nls.builtins.diagnostics.mypy)
      table.insert(opts.sources, nls.builtins.diagnostics.pylint)
      table.insert(opts.sources, nls.builtins.formatting.black)
      table.insert(opts.sources, nls.builtins.formatting.isort)
      -- sh
      table.insert(opts.sources, nls.builtins.diagnostics.shellcheck)
      table.insert(opts.sources, nls.builtins.diagnostics.zsh)
      table.insert(opts.sources, nls.builtins.formatting.shfmt)
      table.insert(opts.sources, nls.builtins.formatting.shellharden)
      -- sql
      table.insert(opts.sources, nls.builtins.formatting.pg_format)
      table.insert(
        opts.sources,
        nls.builtins.formatting.sqlfluff.with({
          extra_args = { "--dialect", "postgres" },
        })
      )
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.sqlfluff.with({
          extra_args = { "--dialect", "postgres" },
        })
      )
      -- misc
      table.insert(opts.sources, nls.builtins.formatting.trim_newlines)
      table.insert(opts.sources, nls.builtins.formatting.trim_whitespace)
      -- yaml
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.yamllint.with({
          condition = function()
            return vim.fn.executable("yamllint") > 0
          end,
        })
      )
    end,
  },
}
