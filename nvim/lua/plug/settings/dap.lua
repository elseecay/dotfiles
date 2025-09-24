local utils = require("utils")
local dap = require("dap")

dap.set_log_level("DEBUG") -- file: vim.fn.stdpath('data')/dap.log

vim.fn.sign_define("DapBreakpoint", {text="🛑", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointCondition", {text="🟥", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapLogPoint", {text="🟣", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointRejected", {text="🟠", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapStopped", {text=">>", texthl="", linehl="", numhl=""})


-- Adapters
-------------------------

local mason_packages_dir = vim.fn.expand("$MASON/packages/")

dap.adapters.gdb =
{
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.adapters.cppdbg =
{
    id = "cppdbg",
    type = "executable",
    command = mason_packages_dir .. "cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    args = {}
}

local debugpy_executable = mason_packages_dir .. "debugpy/debugpy-adapter"
dap.adapters.python = function(cb, config)
    if config.request == "attach" then
        local port = (config.connect or config).port
        local host = (config.connect or config).host or "127.0.0.1"
        cb({
            type = "server",
            port = assert(port, "connect.port is required for a python attach configuration"),
            host = host,
            options = { source_filetype = "python" }
        })
    else
        cb({
            type = "executable",
            command = debugpy_executable,
            options = { source_filetype = "python" },
        })
    end
end


-- Configurations
-------------------------

local gdb_launch_default =
{
    type = "gdb",
    request = "launch",
    name = "GDB Launch",
    program = function()
        return utils.input_wait("Executable", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
    args = ""
}


local cppdbg_launch_default =
{
    type = "cppdbg",
    request = "launch",
    name = "Cppdbg Launch",
    program = function()
        return utils.input_wait("Executable", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    args = ""
}

-- C
-------------------------
dap.configurations.c = { gdb_launch_default, cppdbg_launch_default }

-- C++
-------------------------
dap.configurations.cpp = { gdb_launch_default, cppdbg_launch_default}

-- Rust
-------------------------
dap.configurations.rust = { gdb_launch_default, cppdbg_launch_default }

-- Python
-------------------------
dap.configurations.python =
{
    {
        name = "Launch current file",
        type = "python",
        request = "launch",
        program = "${file}",
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
            else
                return "/usr/bin/python3"
            end
        end
    },
}

-- {
--   name = "Select and attach to process",
--   type = "gdb",
--   request = "attach",
--   program = function()
--      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--   end,
--   pid = function()
--      local name = vim.fn.input("Executable name (filter): ")
--      return require("dap.utils").pick_process({ filter = name })
--   end,
--   cwd = "${workspaceFolder}"
-- },

-- {
--   name = "Attach to gdbserver :1234",
--   type = "gdb",
--   request = "attach",
--   target = "localhost:1234",
--   program = function()
--      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--   end,
--   cwd = "${workspaceFolder}"
-- },
