return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
  },
  keys = {
    {
      "<leader>sg",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc = "Grep (root dir)",
    },
  },
  config = function(_, opts)
    opts.defaults = opts.defaults or {}
    opts.pickers = opts.pickers or {}

    -- Include hidden files
    opts.pickers.find_files = {
      hidden = true,
    }

    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("live_grep_args")
  end,
}
