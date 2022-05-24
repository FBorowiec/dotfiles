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

-- trim whitespaces
vim.cmd([[
    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    augroup TRIM_ON_SAVE
        autocmd!
        autocmd BufWritePre * :call TrimWhitespace()
    augroup END
]])

function LspLocationList()
    vim.lsp.diagnostic.set_loclist({open_loclist = false})
end

