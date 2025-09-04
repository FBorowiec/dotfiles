return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          settings = {
            ltex = {
              language = "en-US",
              dictionary = {
                ["en-US"] = {
                  "Bazel",
                  "bazel",
                  "toolchain",
                  "toolchains",
                  "Toolchain",
                  "Toolchains",
                  "clang",
                  "Clang",
                  "llvm",
                  "LLVM",
                  "Monorepo",
                  "monorepo",
                },
              },
              disabledRules = {},
              hiddenFalsePositives = {},
            },
          },
        },
      },
    },
  },
}
