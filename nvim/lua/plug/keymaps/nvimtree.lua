local utils = require("utils")
local api = require("nvim-tree.api")

local function show_current_file_in_tree()
    local buf = vim.api.nvim_get_current_buf()
    local bufname = vim.api.nvim_buf_get_name(buf)
    if vim.fn.isdirectory(bufname) or vim.fn.isfile(bufname) then
        api.tree.find_file({buf = vim.fn.expand("%:p"), focus = false})
    end
end

utils.keymap_command("n", "<Leader><F1>t", "NvimTreeToggle", "Tree: toggle")
utils.keymap("n", "<Leader><F1>y", show_current_file_in_tree, "Tree: current file")
