return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "                                                     ",
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
      "                                                     ",
      "                 [ linktr.ee/fboro ]                 ",
      "                                                     ",
    }

    -- dashboard.section.buttons.val = {
    --   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    --   dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
    -- }
    dashboard.config.opts.noautocmd = true

    vim.cmd([[autocmd User AlphaReady echo 'ready']])

    alpha.setup(dashboard.config)

    -- Disable folding on alpha buffer
    vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}
