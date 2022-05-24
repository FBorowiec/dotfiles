local M = {}

function M.setup()
    require('gitsigns').setup{
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
        map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
        -- Actions
        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', options)
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', options)
        map('n', ';s', gs.stage_buffer)
        map('n', ';u', gs.undo_stage_hunk)
        map('n', ';r', gs.reset_buffer)
        map('n', ';p', gs.preview_hunk)
        map('n', ';b', function() gs.blame_line { full = true } end)
        map('n', ';bt', gs.toggle_current_line_blame)
        map('n', ';d', gs.diffthis)
        map('n', ';D', function() gs.diffthis('~') end)
        map('n', ';t', gs.toggle_deleted)
        -- text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', options)
      end
    }
end

return M
