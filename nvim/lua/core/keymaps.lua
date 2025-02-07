local utils = require("utils")

-- leader - space 
vim.g.mapleader = " "

-- local leader - ',' 
vim.g.maplocalleader = ","

-- disable arrows in normal mode
utils.keymap("n", "<Up>", "<Nop>", "Disable arrows in normal mode")
-- keymap("n", "<Down>", "<Nop>", "Disable arrows in normal mode")
-- keymap("n", "<Left>", "<Nop>", "Disable arrows in normal mode")
-- keymap("n", "<Right>", "<Nop>", "Disable arrows in normal mode")

utils.keymap_command("n", "<C-s>", "w", "Save a buffer")
utils.keymap_command("i", "<C-s>", "w<Esc>", "Save a buffer, goto normal mode")

utils.keymap("n", "<C-z>", "u", "Undo from normal mode")
utils.keymap("i", "<C-z>", "<C-o>u", "Undo from insert mode")