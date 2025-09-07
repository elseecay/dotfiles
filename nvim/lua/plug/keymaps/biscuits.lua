local utils = require("utils")

local biscuits = require("nvim-biscuits")
utils.keymap("n", "<Leader><F1>b", biscuits.toggle_biscuits, "Toggle biscuits")
