local M = {}

function M.setup()
    vim.g.bufferline = {
        -- Enable/disable animations
        animation = false,
        -- Enable/disable auto-hiding the tab bar when there is a single buffer
        auto_hide = false,
        -- Enable/disable current/total tabpages indicator (top right corner)
        tabpages = true,
        -- Enable/disable close button
        closable = false,
        -- Enables/disable clickable tabs
        --  - left-click: go to buffer
        --  - middle-click: delete buffer
        clickable = false,
        -- Enable/disable icons
        -- if set to 'numbers', will show buffer index in the tabline
        -- if set to 'both', will show buffer index and icons in the tabline
        icons = true,
        -- Sets the icon's highlight group.
        -- If false, will use nvim-web-devicons colors
        icon_custom_colors = false,
        -- Configure icons on the bufferline.
        icon_separator_active = '▎',
        icon_separator_inactive = '▎',
        icon_close_tab = '',
        icon_close_tab_modified = ' ',

        -- Sets the maximum padding width with which to surround each tab
        maximum_padding = 2,
        -- Sets the maximum buffer name length.
        maximum_length = 40,
        -- If set, the letters for each buffer in buffer-pick mode will be
        -- assigned based on their name. Otherwise or in case all letters are
        -- already assigned, the behavior is to assign letters in order of
        -- usability (see order below)
        semantic_letters = true,

        -- New buffer letters are assigned in this order. This order is
        -- optimal for the qwerty keyboard layout but might need adjustement
        -- for other layouts.
        letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
        no_name_title = 'NO NAME',
    }
end

return M
