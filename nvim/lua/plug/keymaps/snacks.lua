local utils = require("utils")
local snacks = require("snacks")

local function toggle_dim()
    if snacks.dim.enabled then
        snacks.dim.disable()
    else
        snacks.dim.enable()
    end
end

utils.keymap("n", "<Leader><F1>d", toggle_dim, "Toggle dim")

