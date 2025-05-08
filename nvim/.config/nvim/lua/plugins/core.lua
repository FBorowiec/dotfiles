return {
  -- set tokyonight theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- disable stating in insert mode
  {
    "akinsho/toggleterm.nvim",
    opts = {
      start_in_insert = false,
    },
  },
  --- additional plugins
  {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end,
  },
  --- disabled plugins
  { "mini.pairs", enabled = false },
}
