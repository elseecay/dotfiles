local dap = require("dap")
local dapui = require("dapui")


dap.listeners.before.attach.dapui_config = function()
    -- expand watches
    local size = #dapui.elements.watches
    while size > 0 do
        dapui.elements.watches.toggle_expand(size)
        size = size - 1
    end
    
    -- close repl, doesnt work for some reason
    -- dapui.close({layout = 2})
    
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    -- dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    -- dapui.close()
end

local function repl_enter_insert_mode()
  if vim.bo.filetype == "dap-repl" then
    vim.cmd("startinsert")
  end
end

vim.api.nvim_create_autocmd("BufEnter", {pattern = "*dap-repl*", callback = repl_enter_insert_mode})
