return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
  },
  opts = function(_, opts)
    opts.defaults = opts.defaults or {}
    opts.pickers = opts.pickers or {}

    -- Configure the find_files picker to include hidden files
    opts.pickers.find_files = {
      hidden = true,
    }
    require("telescope").setup(opts)
    require("telescope").load_extension("live_grep_args")
  end,
}
