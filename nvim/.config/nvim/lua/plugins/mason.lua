return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -----------------------------
        -- PYTHON
        "basedpyright",
        "black",
        "blackd-client",
        "debugpy",
        "isort",
        "mypy",
        "pylint",
        "ruff",
        "ruff-lsp",

        -- "autoflake",
        -- "autopep8",
        -- "blue",
        -- "darker",
        -- "docformatter",
        -- "flake8",
        -- "flakeheaven",
        -- "jedi-language-server",
        -- "mutt-language-server",
        -- "pydocstyle",
        -- "pyflakes",
        -- "pyink",
        -- "pylama",
        -- "pylyzer",
        -- "pyment",
        -- "pyproject-flake8",
        -- "pyre",
        -- "pyright",
        -- "python-lsp-server",
        -- "reorder-python-imports",
        -- "sourcery",
        -- "usort",
        -- "vulture",
        -- "yapf",

        -----------------------------
        -- C++ / RUST
        "clang-format",
        "clangd",
        "cpplint",
        "cpptools",
        "codelldb",
        "rust-analyzer",

        -----------------------------
        -- JSON
        "fixjson",
        "jq",
        "jq-lsp",
        "json-lsp",
        "json-to-struct",
        "jsonld-lsp",
        "jsonlint",

        -----------------------------
        -- YAML
        "yaml-language-server",
        "yamlfix",
        "yamlfmt",
        "yamllint",

        -----------------------------
        -- XML
        "xmlformatter",

        -----------------------------
        -- GIT / GITHUB
        "gitlint",
        "actionlint",
        "commitlint",

        -----------------------------
        -- BAZEL / STARLARK
        "buildifier",
        "starpls",
        "starlark-rust",

        -----------------------------
        -- ANSIBLE
        "ansible-language-server",
        "ansible-lint",

        -----------------------------
        -- MARKDOWN / TEXT
        -- "grammarly-languageserver grammarly",
        "ltex-ls",
        "markdown-oxide",
        "markdown-toc",
        "markdownlint",
        "markdownlint-cli2",
        "markmap-cli",
        "marksman",
        "write-good",
        "markuplint",

        -----------------------------
        -- LUA
        "stylua",
        "luacheck",
        "luaformatter",
        "lua-language-server",

        -----------------------------
        -- BASH
        "shellcheck",
        "shfmt",
        "bash-debug-adapter",
        "bash-language-server",
        "shellharden",

        -----------------------------
        -- DOCKER
        "docker-compose-language-service",
        "dockerfile-language-server",
        "hadolint",

        -----------------------------
        -- SQL
        "sql-formatter",
        "sqlfluff",
        "sqlfmt",
        "sqlls",
        "sqls",

        -----------------------------
        -- c++
        "neocmakelsp",
        "cmake-language-server",
        "cmakelang",
        "cmakelint",

        -----------------------------
        -- JINJA
        "jinja-lsp",

        -----------------------------
        -- OTHERS
        "systemdlint",
        "prettier",
        "prettierd",
        -- "ast-grep",
        -- "harper-ls",
        -- "snyk",
        -- "semgrep",
        -- "sonarlint-language-server",
        -- "trivy",
      },
    },
  },
}
