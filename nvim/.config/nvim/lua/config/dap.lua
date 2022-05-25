local M = {}

local function split_by_space(input)
    local chunks = {}
    for substring in input:gmatch("%S+") do
        table.insert(chunks, substring)
    end
    return chunks
end

function M.set_python_args(args)
    require 'dap'.configurations.python[1].args = split_by_space(args)
end

function M.set_python_args_from_input()
    local args = vim.fn.input("python args for debugging: ")
    M.set_python_args(args)
end

function M.end_debug_session()
    require 'dap'.terminate()
    require 'dapui'.close()
end

local enrich_config = function(config, on_config)
    if not config.pythonPath and not config.python then
        config.pythonPath = "/usr/bin/python3"
    end
    on_config(config)
end

function M.setup()
    vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '🟢', texthl = '', linehl = '', numhl = '' })

    local dap = require('dap')

    -- python: https://github.com/mendes-davi/nvim-config/blob/daf7e8f9974cd4e715c171071b8e3b460365fea9/lua/dap/python.lua
    local opts = vim.tbl_extend("keep", opts or {}, {})
    dap.adapters.python = function(cb, config)
        if config.request == "attach" then
            local port = (config.connect or config).port
            cb {
                type = "server",
                port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                host = (config.connect or config).host or "127.0.0.1",
                enrich_config = enrich_config,
                options = {
                    source_filetype = "python",
                },
            }
        else
            cb {
                type = "executable",
                command = "/usr/bin/python3",
                args = { "-m", "debugpy.adapter" },
                enrich_config = enrich_config,
                options = {
                    source_filetype = "python",
                },
            }
        end
    end

    dap.configurations.python = dap.configurations.python or {}
    table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        console = opts.console,
        pythonPath = opts.pythonPath,
    })
    table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Launch file with arguments",
        program = "${file}",
        args = function()
            local args_string = vim.fn.input "Arguments: "
            return vim.split(args_string, " +")
        end,
        console = opts.console,
        pythonPath = opts.pythonPath,
    })
    table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Attach remote",
        connect = function()
            local host = vim.fn.input "Host [127.0.0.1]: "
            host = host ~= "" and host or "127.0.0.1"
            local port = tonumber(vim.fn.input "Port [5678]: ") or 5678
            return { host = host, port = port }
        end,
    })

    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = os.getenv("HOME") .. "/.cpptools/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7",
    }

    -- Dap load launch.json from vscode when avaliable
    if vim.fn.filereadable("./.vscode/launch.json") or vim.fn.filereadable("./launch.json") then
        require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })
    end

    dap.configurations.cpp = {
        {
            type = 'cppdbg',
            request = 'launch',
            name = "Launch file",
            program = "/home/fra/dev/leetcode/bazel-bin/problems/test/unit_tests",
            args = {},
            cwd = "/home/fra/dev/leetcode",
            cppdbgPath = os.getenv("HOME") .. "/.cpptools/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7",
        },
    }

    require("dapui").setup({
        sidebar = {
            elements = {
                -- Provide as ID strings or tables with "id" and "size" keys
                { id = "scopes", size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "watches", size = 00.25 },
            },
        },
        tray = {
            elements = { "repl" },
        },
    })
end

local load_launchjs = function()
    require("dap.ext.vscode").load_launchjs()
end
if not pcall(load_launchjs) then
    vim.notify("Failed to parse launch.json", "warn")
end

return M
