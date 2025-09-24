local utils = require("utils")
local quicker = require("quicker")

utils.keymap("n", "<Leader><F1>q", function() quicker.toggle({focus = true}) end, "Toggle quickfix")
utils.keymap("n", "<Leader><F1>Q", function() quicker.toggle({focus = true, loclist = true}) end, "Toggle loclist")

