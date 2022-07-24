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
--
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
