return {
  {
    "stevearc/conform.nvim",
    enabled = false,
    opts = {
      formatters_by_ft = {
        bazel = { "buildifier" },
        cpp = { "clang-format" },
        cmake = { "cmake-format" },
        json = { "fixjson" },
        lua = { "stylua" },
        markdown = { "markdownlint" },
        python = { { "isort", "black" } },
        sh = { { "shfmt", "shellharden", "shellcheck" } },
        sql = { { "pg-format", "sqlfluff" } },
      },
    },
  },
}
