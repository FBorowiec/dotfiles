-- switch source/header file in cpp
vim.cmd([[
    function! SwitchSourceHeader()
        let filepath = expand('%:p:h')
        let filename = expand('%:t:r')
        let fileending = expand('%:e')
        if (fileending == "cpp")
            let filetype = ".h*"
            if (stridx(filepath, "/src"))
                let filepath = split(filepath, "/src")[0] . "/**/"
            endif
        endif
        if (fileending == "hpp" || fileending == "h")
            let filetype = ".cpp"
            if (stridx(filepath, "/include"))
                let filepath = split(filepath, "/include")[0] . "/**/"
            endif
        endif
        exec "find " . filepath . filename . filetype
    endfun
]])

vim.cmd([[
    let t:is_transparent = 0
    function! ToggleTransparency()
        if t:is_transparent == 0
            highlight Normal ctermbg=none guibg=none
            highlight NonText ctermbg=none guibg=none
            let t:is_transparent = 1
        else
            set background=dark
            let t:is_tranparent = 0
        endif
    endfun
]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

local function get_tree_size()
    return require 'nvim-tree.view'.View.width
end

require('nvim-tree.events').subscribe('TreeOpen', function()
    require('bufferline.api').set_offset(get_tree_size())
end)

require('nvim-tree.events').subscribe('Resize', function()
    require('bufferline.api').set_offset(get_tree_size())
end)

require('nvim-tree.events').subscribe('TreeClose', function()
    require('bufferline.api').set_offset(0)
end)
