return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },  -- Use ruff format from pyproject.toml
        markdown = { "prettier", "markdownlint-cli2" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        ["markdownlint-cli2"] = {
          command = "markdownlint-cli2",
          args = { "--fix", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },
}
