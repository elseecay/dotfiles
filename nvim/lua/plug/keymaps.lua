local autopairs = require("nvim-autopairs")
local utils = require("utils")
local dap = require("dap")


-- ************************
-- bufferline


utils.keymap_command("n", "<Right>", "BufferLineCycleNext", "Go to next buffer")
utils.keymap_command("n", "<Left>", "BufferLineCyclePrev", "Go to prev buffer")

local function close_current_buffer(save)
    local cur_buf_number = vim.api.nvim_get_current_buf()
    if save then
        vim.cmd("silent! w")
    end
    vim.cmd("BufferLineCyclePrev")
    vim.cmd(string.format("silent! bdelete! %d", cur_buf_number))
end

utils.keymap("n", "<Down>", function() close_current_buffer(true) end, "Close current buffer and save changes")
utils.keymap("n", "<S-Down>", function() close_current_buffer(false) end, "Close current buffer without saving")


-- ************************
-- toggleterm


utils.keymap_command("n", "<C-\\>", "ToggleTerm", "Toggle terminal")
utils.keymap_command("t", "<C-\\>", "ToggleTerm", "Toggle terminal")


-- ************************
-- nvim_tree


utils.keymap_command("n", "<Leader>t", "NvimTreeToggle", "Toggle file tree")


-- ************************
-- debugging


utils.keymap("n", "<F5>", function() dap.continue() end, "DAP start/continue")
utils.keymap("n", "<C-F5>", function() dap.run_last() end, "DAP run last configuration")
utils.keymap("n", "<S-F5>", function() dap.terminate({all=true, on_done=function() vim.notify("Debug session terminated") end}) end, "DAP terminate all sessions")
utils.keymap("n", "<F9>", function() dap.toggle_breakpoint() end, "DAP toggle breakpoint")
utils.keymap("n", "<S-F9>", function() dap.clear_breakpoints() end, "DAP remove all breakpoints")
utils.keymap("n", "<F8>", function() dap.step_over() end, "DAP step over")
utils.keymap("n", "<S-F8>", function() dap.step_out() end, "DAP step out")
utils.keymap("n", "<F7>", function() dap.step_into() end, "DAP step into")
utils.keymap("n", "<F6>", function() dap.repl.toggle() end, "DAP open console")


-- ************************
-- coq, autopairs


-- COQ keymaps:
-- <esc> -> exit to normal
-- <bs> -> backspace always, even when completion menu is open
-- <c-w> -> delete word before the cursor, even when completion menu is open
-- <c-u> -> delete all entered characters before the cursor, even when completion menu is open
-- <cr> -> used to select completion if completion menu is open
-- <tab> -> if completion menu is open: select next item
-- <s-tab> -> if completion menu is open: select prev item


local function pumvisible_cond(t, f)
    return function()
        if vim.fn.pumvisible() == 0 then
            return f
        end
        return t
    end
end

G.keymap_handlers.ictrlc = pumvisible_cond("<C-e><C-c>", "<C-c>")
utils.keymap("i", "<C-c>", "v:lua.G.keymap_handlers.ictrlc()", "Close PUM and goto normal mode", {expr=true})

G.keymap_handlers.itab = pumvisible_cond("<C-n>", "<Tab>")
utils.keymap("i", "<Tab>", "v:lua.G.keymap_handlers.itab()", "Select next item", {expr=true})

G.keymap_handlers.ishifttab = pumvisible_cond("<C-p>", "<BS>")
utils.keymap("i", "<S-Tab>", "v:lua.G.keymap_handlers.ishifttab()", "Select prev item", {expr=true})

G.keymap_handlers.iesc = pumvisible_cond("<C-e>", "<Esc>")
utils.keymap("i", "<Esc>", "v:lua.G.keymap_handlers.iesc()", "Close PUM", {expr=true})

G.keymap_handlers.ienter = function()
    if vim.fn.pumvisible() == 0 then
        return autopairs.autopairs_cr()
    end
    if vim.fn.complete_info({"selected"}).selected ~= 1 then
        return autopairs.esc("<C-y>")
    end
    return autopairs.esc("<C-e>") .. autopairs.autopairs_cr()
end

utils.keymap("i", "<CR>", "v:lua.G.keymap_handlers.ienter()", "Select PUM item", {expr=true}, true)

G.keymap_handlers.ibackspace = function()
    if vim.fn.pumvisible() == 0 then
        return autopairs.autopairs_bs()
    end
    return autopairs.esc("<C-e>") .. autopairs.autopairs_bs()
end

utils.keymap("i", "<BS>", "v:lua.G.keymap_handlers.ibackspace()", "Close PUM and remove character", {expr=true}, true)