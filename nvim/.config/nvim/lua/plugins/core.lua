return {
  -- set tokyonight theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
  --- additional plugins
  {
    "xiyaowong/transparent.nvim",
    "szw/vim-maximizer",
    "davidgranstrom/nvim-markdown-preview",
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end,
  },
}
