local utils = require("utils")
local wk = require("which-key")
local grug = require("grug-far")

wk.add({{"<Leader>r", group = "Replace", mode = "n"}})
utils.keymap("n", "<Leader>rr", grug.open, "Empty window")
utils.keymap("n", "<Leader>rf", function() grug.open({prefills = {paths = vim.fn.expand("%")}}) end, "Current file")
utils.keymap("n", "<Leader>rw", function() grug.open({prefills = {search = vim.fn.expand("<cword>")}}) end, "Word under cursor")
utils.keymap("n", "<Leader>ra", function() grug.open({engine = "astgrep"}) end, "Use ast-grep")

