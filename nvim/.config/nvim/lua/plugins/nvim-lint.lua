return {
  {
    "mfussenegger/nvim-lint",
    enabled = false,
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        ansible = { "ansible-lint" },
        bazel = { "buildifier" },
        cpp = { { "clang-format", "clang-tidy" } },
        ghaction = { "actionlint" },
        json = { "jsonlint" },
        lua = { "luacheck" },
        markdown = { "markdownlint" },
        python = { { "mypy", "pylint", "ruff" } },
        sh = { { "shellcheck", "zsh" } },
        sql = { "sqlfluff" },
        yaml = { "yamllint" },
      },
    },
  },
}
