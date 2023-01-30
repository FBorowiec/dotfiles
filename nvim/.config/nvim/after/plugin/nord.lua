-- vim.g.nord_contrast = false
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = false
-- vim.g.nord_uniform_diff_background = true
-- vim.g.nord_bold = false

-- Load the colorscheme
-- require('nord').set()

require 'nordic'.setup {
    -- Telesccope custom configs.
    telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
    },
    -- Enable bold keywords.
    bold_keywords = true,
    -- Enable italicized comments.
    italic_comments = true,
    -- Enable general editor background transparency.
    transparent_bg = false,
    -- Override styling of any highlight group.
    -- (see next section for an example)
    override = {},
    cursorline = {
        bold = false,
        -- Avialable themes: 'dark', 'light'.
        theme = 'light'
    }
}
