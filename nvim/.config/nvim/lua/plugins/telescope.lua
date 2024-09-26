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
      desc = "Grep with args (root dir)",
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("live_grep_args")
  end,
}
