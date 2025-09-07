local utils = require("utils")
local dap = require("dap")
local dapui = require("dapui")
local wk = require("which-key")


local function debug_start_continue()
    vim.cmd("NvimTreeClose")
    dap.continue()
end


utils.keymap("n", "<F5>", debug_start_continue, "DAP start/continue")
utils.keymap("n", "<C-F5>", dap.run_last, "DAP run last configuration")
utils.keymap("n", "<S-F5>", function() dap.terminate({all=true, on_done=function() vim.notify("Debug session terminated") end}) end, "DAP terminate all sessions")
utils.keymap("n", "<F6>", dap.toggle_breakpoint, "DAP toggle breakpoint")
utils.keymap("n", "<S-F6>", dap.clear_breakpoints, "DAP remove all breakpoints")
utils.keymap("n", "<F8>", dap.step_over, "DAP step over")
utils.keymap("n", "<S-F8>", dap.step_out, "DAP step out")
utils.keymap("n", "<F7>", dap.step_into, "DAP step into")

wk.add({{"<Leader>d", group = "Debug", mode = "n"}})

utils.keymap("n", "<Leader>du", dapui.toggle, "DAP toggle UI")
utils.keymap_command("n", "<Leader>dt", "DapVirtualTextToggle", "DAP toggle virtual text")

local function toggle_repl()
    dapui.toggle({layout = 2})
end

utils.keymap("n", "<Leader>dr", toggle_repl, "DAP toggle repl")

local function expand_watches()
    local w = dapui.elements.watches
    local i = #w.get()
    while i > 0 do
        if not w.get()[i].expanded then
            w.toggle_expand(i)
        end
        i = i - 1
    end
end

utils.keymap("n", "<Leader>de", expand_watches, "DAP expand watches")

local function collapse_watches()
    local w = dapui.elements.watches
    local i = #w.get()
    while i > 0 do
        if w.get()[i].expanded then
            w.toggle_expand(i)
        end
        i = i - 1
    end
end

utils.keymap("n", "<Leader>dc", collapse_watches, "DAP collapse watches")

local function add_watch()
    local name = utils.input("Watch: ")
    if name ~= nil then
        dapui.elements.watches.add(name)
    end
end

utils.keymap("n", "<Leader>da", add_watch, "DAP add watch")

