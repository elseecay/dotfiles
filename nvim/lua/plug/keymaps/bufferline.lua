local utils = require("utils")

utils.keymap_command("n", "<Right>", "BufferLineCycleNext", "Go to next buffer")
utils.keymap_command("n", "<Left>", "BufferLineCyclePrev", "Go to prev buffer")
utils.keymap_command("n", "<S-Right>", "BufferLineMoveNext", "Swap buffer with next")
utils.keymap_command("n", "<S-Left>", "BufferLineMovePrev", "Swap buffer with prev")

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
