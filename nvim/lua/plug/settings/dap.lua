local utils = require("utils")
local dap = require("dap")
local mason_registry = require("mason-registry")


vim.fn.sign_define("DapBreakpoint", {text="🛑", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointCondition", {text="🟥", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapLogPoint", {text="🟣", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointRejected", {text="🟠", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapStopped", {text=">>", texthl="", linehl="", numhl=""})

-- gdb

dap.adapters.gdb =
{
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

-- cppdbg

local cppdbg_executable = mason_registry.get_package("cpptools"):get_install_path() .. "/extension/debugAdapters/bin/OpenDebugAD7"

dap.adapters.cppdbg =
{
    id = "cppdbg",
    type = "executable",
    command = cppdbg_executable,
}

-- debugpy

local debugpy_executable = mason_registry.get_package("debugpy"):get_install_path() .. "/debugpy-adapter"

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


-- c/c++/rust
local gdb_launch_default = 
{
    name = "GDB Launch",
    type = "gdb",
    request = "launch",
    program = function()
        return utils.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
}

dap.configurations.c = { gdb_launch_default }
dap.configurations.cpp = { gdb_launch_default }
dap.configurations.rust = { gdb_launch_default }

-- python
dap.configurations.python =
{
    {
        name = "Launch file",
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
