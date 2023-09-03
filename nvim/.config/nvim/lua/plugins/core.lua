return {
  -- set tokyonight theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
  -- alpha-nvim
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


               [ linktr.ee/fboro ]
]]
      opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "clangd")
      table.insert(opts.ensure_installed, "prettierd")
      table.insert(opts.ensure_installed, "pyright")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "cpp",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "xiyaowong/transparent.nvim",
    "szw/vim-maximizer",
    "davidgranstrom/nvim-markdown-preview",
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end,
  },
  { "echasnovski/mini.pairs", enabled = false },
}
