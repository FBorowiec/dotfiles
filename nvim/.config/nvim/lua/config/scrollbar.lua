local M = {}

function M.setup()
    require("scrollbar.handlers.search").setup()
    require("scrollbar").setup({
        show = true,
        show_in_active_only = false,
        set_highlights = true,
        -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
        folds = 1000,
        -- disables if no. of lines in buffer exceeds this
        max_lines = false,
        handle = {
            text = " ",
            color = nil,
            cterm = nil,
            highlight = "CursorColumn",
            -- Hides handle if all lines are visible
            hide_if_all_visible = true,
        },
        marks = {
            Search = {
                text = { "-", "=" },
                priority = 0,
                color = nil,
                cterm = nil,
                highlight = "Search",
            },
            Error = {
                text = { "-", "=" },
                priority = 1,
                color = nil,
                cterm = nil,
                highlight = "DiagnosticVirtualTextError",
            },
            Warn = {
                text = { "-", "=" },
                priority = 2,
                color = nil,
                cterm = nil,
                highlight = "DiagnosticVirtualTextWarn",
            },
            Info = {
                text = { "-", "=" },
                priority = 3,
                color = nil,
                cterm = nil,
                highlight = "DiagnosticVirtualTextInfo",
            },
            Hint = {
                text = { "-", "=" },
                priority = 4,
                color = nil,
                cterm = nil,
                highlight = "DiagnosticVirtualTextHint",
            },
            Misc = {
                text = { "-", "=" },
                priority = 5,
                color = nil,
                cterm = nil,
                highlight = "Normal",
            },
        },
        excluded_buftypes = {
            "terminal",
        },
        excluded_filetypes = {
            "prompt",
            "TelescopePrompt",
        },
        autocmd = {
            render = {
                "BufWinEnter",
                "TabEnter",
                "TermEnter",
                "WinEnter",
                "CmdwinLeave",
                "TextChanged",
                "VimResized",
                "WinScrolled",
            },
            clear = {
                "BufWinLeave",
                "TabLeave",
                "TermLeave",
                "WinLeave",
            },
        },
        handlers = {
            diagnostic = true,
            -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
            search = true,
        },
    })

    -- local gitsign = require('gitsigns')
    -- local gitsign_hunks = require('gitsigns.hunks')

    -- require('scrollbar.handlers').register('git', function(bufnr)
    --     local nb_lines = vim.api.nvim_buf_line_count(bufnr)
    --     -- NOTE: change to corresponding marks from scrollbar setup
    --     local colors_type = {
    --         add = 'GitAdd',
    --         delete = 'GitDelete',
    --         change = 'GitChange',
    --         changedelete = 'GitChange'
    --     }

    --     local lines = {}
    --     local hunks = gitsign.get_hunks(bufnr)
    --     if hunks then
    --         for _, hunk in ipairs(hunks) do
    --             hunk.vend = math.min(hunk.added.start, hunk.removed.start) + hunk.added.count + hunk.removed.count
    --             local signs = gitsign_hunks.calc_signs(hunk, 0, nb_lines)
    --             for _, sign in ipairs(signs) do
    --                 table.insert(lines, {
    --                     line = sign.lnum,
    --                     type = colors_type[sign.type]
    --                 })
    --             end
    --         end
    --     end
    --     return lines
    -- end)
end

return M
