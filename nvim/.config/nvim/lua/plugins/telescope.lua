local telescope = require("telescope")
local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-frecency.nvim" },
  },
  keys = {
    {
      "<leader>sg",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc = " Grep with args (root dir)",
    },
    {
      "<leader>ff",
      "<cmd>Telescope git_files<CR>",
      desc = "Find Files (git-files)",
    },
    {
      "<leader>fg",
      "<cmd>Telescope find_files<CR>",
      desc = "Find Files (Root Dir)",
    },
    {
      "<leader>fb",
      "<cmd>Telescope file_browser<CR>",
      desc = "Browse Files",
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
            ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
            ["<C-space>"] = actions.to_fuzzy_refine,
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob",
            "!.git/",
            "--ignore-file",
            ".gitignore",
          },
        },
      },
    })
    telescope.load_extension("live_grep_args")
    telescope.load_extension("media_files")
    telescope.load_extension("file_browser")
    telescope.load_extension("frecency")
  end,
}
