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
  --- additional plugins
  {
    "declancm/maximize.nvim",
    config = true,
  },
  {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end,
  },
  --- disabled plugins
  { "mini.pairs", enabled = false },
}
