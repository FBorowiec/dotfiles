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

    -- Include hidden files
    opts.pickers.find_files = {
      hidden = true,
    }

    local telescope = require("telescope")
    telescope.load_extension("live_grep_args")
    return opts
  end,
}
