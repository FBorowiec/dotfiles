return {
  {
    "nvimtools/none-ls.nvim",
    enabled = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        -- CODE ACTIONS
        nls.builtins.code_actions.gitsigns,
        nls.builtins.code_actions.refactoring,

        -- COMPLETION
        -- lua
        nls.builtins.completion.luasnip,
        -- tags
        nls.builtins.completion.tags,
        -- snippets
        nls.builtins.completion.vsnip,

        -- LINTING / FORMATTING
        -- ansible
        nls.builtins.diagnostics.ansiblelint,
        -- bazel
        nls.builtins.diagnostics.buildifier,
        nls.builtins.formatting.buildifier,
        -- cpp
        nls.builtins.formatting.clang_format,
        -- nls.builtins.diagnostics.clazy,  -- heavy
        nls.builtins.diagnostics.cppcheck,
        nls.builtins.formatting.cmake_format,
        -- github actions
        nls.builtins.diagnostics.actionlint,
        -- git
        nls.builtins.diagnostics.gitlint,
        -- javascript
        nls.builtins.formatting.prettierd,
        -- json
        nls.builtins.formatting.prettier,
        -- lua
        nls.builtins.formatting.stylua,
        -- markdown
        nls.builtins.diagnostics.mdl,
        -- python
        nls.builtins.diagnostics.mypy,
        nls.builtins.diagnostics.pylint,
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort,
        -- sh
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.shellharden,
        -- sql
        nls.builtins.formatting.pg_format,
        nls.builtins.formatting.sqlfluff.with({
          extra_args = { "--dialect", "postgres" },
        }),
        nls.builtins.diagnostics.sqlfluff.with({
          extra_args = { "--dialect", "postgres" },
        }),
        -- yaml
        nls.builtins.diagnostics.yamllint,
        -- zsh
        nls.builtins.diagnostics.zsh,
      })
    end,
  },
}
