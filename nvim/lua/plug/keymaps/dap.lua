local utils = require("utils")
local dap = require("dap")
local dapview = require("dap-view")
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

utils.keymap_command("n", "<Leader>dt", "DapVirtualTextToggle", "DAP toggle virtual text")

local function add_watch()
    local callback = function(r)
        if #r > 0 then dapview.add_expr(r) end
    end
    utils.input_async("Watch", "", "", callback)
end

utils.keymap("n", "<Leader>dv", function() dapview.toggle(true) end, "View: toggle")
utils.keymap("n", "<Leader>da", add_watch, "View: add watch")
utils.keymap("n", "<Leader>dz", dapview.add_expr, "View: add watch under cursor")
utils.keymap("n", "<Leader>ds", function() dapview.jump_to_view("scopes") end, "View: scopes")
utils.keymap("n", "<Leader>dw", function() dapview.jump_to_view("watches") end, "View: watches")
utils.keymap("n", "<Leader>dc", function() dapview.jump_to_view("console") end, "View: console")

