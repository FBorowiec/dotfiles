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
  -- toggleterm
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<leader>ft", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal (Root Dir)" },
      { "<leader>fT", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal (cwd)" },
      { "<c-/>", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal (Root Dir)" },
      { "<c-_>", "<cmd>ToggleTerm direction=float<cr>", desc = "which_key_ignore" },
    },
    opts = {
      start_in_insert = true,
      direction = "float",
      float_opts = {
        border = "curved", -- or "single", "double", "shadow"
        winblend = 0,
      },
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
