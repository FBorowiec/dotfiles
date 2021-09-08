fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_ON_SAVE
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()

lua << EOF
local function write_to_file(filename, lines)
    vim.cmd('e ' .. filename)
    vim.cmd('%delete')
    for _,line in pairs(lines) do
        vim.cmd("call append(line('$'), '" .. line .. "')")
    end
    vim.cmd('1d')
    vim.cmd('w')
    vim.cmd('e#')
end

function _G.create_python_vimspector_json_for_bazel_test()
    local test_filter = require('bazel').get_gtest_filter()
    local executable =  require('bazel').get_bazel_test_executable()
    local lines = {
        '{',
        '  "configurations": {',
        '    "PyTest": {',
        '      "adapter": "debugpy",',
        '      "default": "false",',
        '      "configuration": {',
        '         "type": "python",',
        '         "request": "launch",',
        '         "python": "/usr/bin/python3",',
        '         "stopOnEntry": false,',
        '         "console": "externalTerminal",',
        '         "debugOptions": [],',
        '         "cwd": "${workspaceRoot}",',
        '         "program": "' .. executable .. '",',
        '         "args": []',
        '      }',
        '      "breakpoints": {',
        '        "exception": {',
        '          "raised": "Y",',
        '          "uncaught": "Y",',
        '          "userUnhandled": "Y"',
        '        }',
        '      }',
        '    }',
        '  }',
        '}'}
    write_to_file('.vimspector.json', lines)
end

function _G.create_cpp_vimspector_json_for_bazel_test()
    local test_filter = require('bazel').get_gtest_filter()
    local executable =  require('bazel').get_bazel_test_executable()
    local lines = {
        '{',
        '  "configurations": {',
        '    "GTest": {',
        '      "adapter": "vscode-cpptools",',
        '      "configuration": {',
        '        "request": "launch",',
        '        "program": "' .. executable .. '",',
        '        "args": ["--gtest_filter=\'\'' .. test_filter .. '\'\'"],',
        '        "stopOnEntry": false',
        '      }',
        '    }',
        '  }',
        '}'}
    write_to_file('.vimspector.json', lines)
end

function _G.DebugPythonTest()
    create_python_vimspector_json_for_bazel_test()
    vim.cmd('new')
    vim.cmd('call termopen("bazel run " . g:current_bazel_target, {"on_exit": "StartVimspector"})')
end

function _G.DebugCppTest()
    create_cpp_vimspector_json_for_bazel_test()
    vim.cmd('new')
    vim.cmd('call termopen("bazel build " . g:bazel_config . " -c dbg " . g:current_bazel_target, {"on_exit": "StartVimspector"})')
end
EOF

function! StartVimspector(job_id, code, event) dict
    if a:code == 0
        close
        call vimspector#Launch()
    endif
endfun

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

map <F2> :call SwitchSourceHeader()<cr>
