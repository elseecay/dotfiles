local utils = require("utils")

vim.g.mapleader = " "
vim.g.maplocalleader = ","

utils.keymap("n", "<Up>", "<Nop>", "Disable UP in normal mode")
utils.keymap("v", "<Up>", "<Nop>", "Disable UP in visual mode")
utils.keymap("v", "<Down>", "<Nop>", "Disable DOWN in visual mode")
utils.keymap("v", "<Left>", "<Nop>", "Disable LEFT in visual mode")
utils.keymap("v", "<Right>", "<Nop>", "Disable RIGHT in visual mode")

utils.keymap("n", "<C-s>", ":w<CR>", "Save a buffer")
utils.keymap("i", "<C-s>", "<Esc>:w<CR>", "Goto normal mode, save buffer")

utils.keymap("n", "<C-z>", "u", "Undo from normal mode")
utils.keymap("i", "<C-z>", "<C-o>u", "Undo from insert mode")

utils.keymap("n", "<A-Left>", "<C-o>", "Go back")
utils.keymap("n", "<A-Right>", "<C-i>", "Go forward")
utils.keymap("n", "<A-Up>", "<C-]>", "Go to declaration")

utils.keymap("n", "<C-e>", "<C-w>w", "Select next window")
utils.keymap("i", "<C-e>", "<Esc><C-w>w", "Select next window")
utils.keymap("n", "<C-q>", "<C-w>W", "Select prev window")
utils.keymap("i", "<C-q>", "<Esc><C-w>W", "Select prev window")
utils.keymap("n", "<C-c>", "<C-w>c", "Close current window")
utils.keymap("i", "<C-c>", "<Esc><C-w>c", "Close current window")

utils.keymap("v", "<Tab>", ">", "Indent selection")
utils.keymap("v", "<S-Tab>", "<", "Outdent selection")

if not G.use_plugins then
    G.keymap_handlers.c_enter = utils.pumvisible_cond("<C-y>", "<CR>")
    utils.keymap("c", "<CR>", "v:lua.G.keymap_handlers.c_enter()", "Select item if PUM visible", {expr=true})
end

-- doesnt work properly
-- G.keymap_handlers.c_esc = utils.pumvisible_cond("<C-e>", "<Esc>")
-- utils.keymap("c", "<Esc>", "v:lua.G.keymap_handlers.c_esc()", "Close PUM, keep open command mode", {expr=true})

local bm = require("core.code.bookmarks")
utils.keymap("n", "<C-A-Right>", bm.jump_to_next_global_letter_bookmark, "Jump to next global letter bookmark")
utils.keymap("n", "<C-A-Left>", bm.jump_to_prev_global_letter_bookmark, "Jump to prev global letter bookmark")
utils.keymap("n", "<C-A-Up>", bm.toggle_global_letter_bookmark, "Toggle global letter boomark")

-- off default help window
utils.keymap("n", "<F1>", "<nop>")

local function toggle_relative_line_numbers()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
end

utils.keymap("n", "<Leader><F1>n", toggle_relative_line_numbers, "Toggle relative line numbers")

